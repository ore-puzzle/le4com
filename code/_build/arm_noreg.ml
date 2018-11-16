module S = Syntax
open Arm_spec

exception Error of string
let err s = raise (Error s)

(* ==== メモリアクセス関連 ==== *)

(* 「reg中のアドレスからoffsetワード目」をあらわすaddr *)
let mem_access reg offset = RI (reg, offset * 4)

let local_access i = mem_access Fp (-i-2)

(* Vm.Param は 0 から数えるものと仮定 *)
let param_to_reg = function
    0 -> A1
  | 1 -> A2
  | i -> err ("invalid parameter: " ^ string_of_int i)

(* Vm.operandから値を取得し，レジスタrdに格納するような
   stmt listを生成 *)
let gen_operand rd = function
    Vm.Param i ->
      let rs = param_to_reg i in
      if rd = rs then [] else [Instr (Mov (rd, (R rs)))]
  | Vm.Local i -> [Instr (Ldr (rd, local_access i))]
  | Vm.Proc  lbl -> [Instr (Ldr (rd, L lbl))]
  | Vm.IntV  i -> [Instr (Mov (rd, I i))]

(* ==== support function ==== *)
let fresh_label =
  let counter = ref 0 in
  let body str =
    let v = !counter in
    counter := v + 1;
    "LL" ^ str ^ "_" ^ (string_of_int v)
  in
    body

let make_instr_of_malloc a1 ops =
  let rec body_loop ofs = function
      [] -> []
    | (Vm.Param i) :: rest when param_to_reg i = a1 ->
        [Instr (Ldr (V1, mem_access Sp 0));
         Instr (Str (V1, mem_access a1 ofs))] @
        body_loop (ofs + 1) rest
    | op :: rest -> 
        (gen_operand V1 op) @ 
        [Instr (Str (V1, mem_access a1 ofs))] @
        body_loop (ofs + 1) rest
  in
    body_loop 0 ops

let to_binary_str i =
  let rec body_loop n mod_list =
    let quo = n / 2 in
    let rem = n mod 2 in
    if quo = 0 then
      rem :: mod_list
    else
      body_loop quo (rem :: mod_list)
  in
    List.fold_left (fun x y -> x ^ y) "" (List.map string_of_int (body_loop i []))

let get_max_range bstr =
  try
    let left = String.index bstr '1' in
    let right = String.rindex bstr '1' in
    right - left + 1
  with
    Not_found -> 0

let imm_to_ldr [stmt] =
  match stmt with
    Instr instr ->
     (match instr with
        Mov (reg, addr) ->
         (match addr with 
            I i when (get_max_range (to_binary_str i)) > 8 -> [Instr (Ldr (reg, L (string_of_int i)))]
          | _ -> [stmt])
      | Add (reg1, reg2, addr) ->
         (match addr with
            I i when (get_max_range (to_binary_str i)) > 8 -> 
              [Instr (Ldr (A4, L (string_of_int i))); Instr (Add (reg1, reg2, R A4))]
          | _ -> [stmt])
      | Cmp (reg, addr) ->
         (match addr with
            I i when (get_max_range (to_binary_str i)) > 8 -> 
              [Instr (Ldr (A4, L (string_of_int i))); Instr (Cmp (reg, R A4))]
          | _ -> [stmt])
      | _ -> [stmt])
  | _ -> [stmt]
         


(* ==== 仮想マシンコード --> アセンブリコード ==== *)

(* V.decl -> loc list *)
let gen_decl (Vm.ProcDecl (name, nlocal, instrs)) =
  (* Vm.instr -> stmt list *)
  let gen_instr = function
      Vm.Move (id, op) -> 
        (gen_operand V1 op) @ 
        [Instr (Str (V1, local_access id))]
    | Vm.BinOp (id, binOp, op1, op2) ->
        let bop_instr = 
         (match binOp with 
            Plus -> [Instr (Add (V1, V1, (R V2)))]
          | Mult -> [Instr (Mul (V1, V1, V2))]
          | Lt ->
              let l1 = fresh_label name in
              let l2 = fresh_label name in
              [Instr (Cmp (V1, (R V2)));
               Instr (Blt l1);
               Instr (Mov (V1, (I 0)));
               Instr (B l2);
               Label l1;
               Instr (Mov (V1, (I 1)));
               Label l2])
        in
          (gen_operand V1 op1) @
          (gen_operand V2 op2) @
          bop_instr @
          [Instr (Str (V1, local_access id))]        
    | Vm.Label label -> [Label label]
    | Vm.BranchIf (op, label) ->
        (gen_operand V1 op) @
        [Instr (Cmp (V1, (I 0)));
         Instr (Bne label)]
    | Vm.Goto label -> [Instr (B label)]
    | Vm.Call (id, op_f, [op1; op2]) ->
        [Instr (Str (A1, mem_access Sp 0));
         Instr (Str (A2, mem_access Sp 1))] @
        (gen_operand A1 op1) @
        (gen_operand A2 op2) @
        (gen_operand V1 op_f) @
        [Instr (Blx V1);
         Instr (Str (A1, local_access id));
         Instr (Ldr (A1, mem_access Sp 0));
         Instr (Ldr (A2, mem_access Sp 1))]        
    | Vm.Return op ->
        (gen_operand A1 op) @
        [Instr (B (name ^ "_ret"))]
    | Vm.Malloc (id, ops) ->
        let part_of_instr = make_instr_of_malloc A1 ops in
        [Instr (Str (A1, mem_access Sp 0));
         Instr (Str (A2, mem_access Sp 1));
         Instr (Mov (A1, (I (List.length ops))));
         Instr (Bl "mymalloc");
         Instr (Str (A1, local_access id));
         Instr (Ldr (A2, mem_access Sp 1))] @
         part_of_instr @
        [Instr (Ldr (A1, mem_access Sp 0))]       
    | Vm.Read (id, op, i) ->
        (gen_operand V1 op) @
        [Instr (Ldr (V1, mem_access V1 i));
         Instr (Str (V1, local_access id))]
  in
    let instr_list = List.concat (List.map imm_to_ldr (List.map (fun x -> [x]) (List.concat (List.map gen_instr instrs)))) in
    [Dir (D_align 2);
     Dir (D_global name);
     Label name;
     Instr (Str (Fp, mem_access Sp (-1)));
     Instr (Str (Lr, mem_access Sp (-2)));
     Instr (Sub (Fp, Sp, (I 4)));
     Instr (Sub (Sp, Sp, (I ((nlocal + 4) * 4))))] @
     instr_list @
    [Label (name ^ "_ret");
     Instr (Add (Sp, Fp, (I 4)));
     Instr (Ldr (Lr, mem_access Fp (-1)));
     Instr (Ldr (Fp, mem_access Fp 0));
     Instr (Bx Lr)]

(* entry point: Vm.decl list -> stmt list *)
let codegen vmprog =
  Dir D_text :: List.concat (List.map gen_decl vmprog)
