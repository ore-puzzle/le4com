module S = Syntax
open Arm_spec

exception Error of string
let err s = raise (Error s)

(* ==== メモリアクセス関連 ==== *)

(* Reg.reg -> reg *)
let reg_mappings = [
  (Reg.reserved_reg, Ip);
  (0, V1);
  (1, V2);
  (2, V3);
  (3, V4);
  (4, V5);
  (5, V6);
  (6, V7);
]

let reg_of r = List.assoc r reg_mappings

(* 「reg中のアドレスからoffsetワード目」をあらわすaddr *)
let mem_access reg offset = RI (reg, offset*4)

let local_access i = mem_access Fp (-i-2)

let param_to_reg = function
    0 -> A1
  | 1 -> A2
  | i -> err ("invalid parameter: " ^ string_of_int i)

(* Reg.operand から値を取得し，レジスタrdに格納するような
   stmt listを生成 *)
let gen_operand rd = function
    Reg.Param i ->
      let rs = param_to_reg i in
      if rd = rs then [] else [Instr (Mov (rd, R rs))]
  | Reg.Reg r ->
      let rs = reg_of r in
      if rd = rs then [] else [Instr (Mov (rd, R rs))]
  | Reg.Proc lbl -> [Instr (Ldr (rd, L lbl))]
  | Reg.IntV i -> [Instr (Mov (rd, I i))]

let addr_of_rop = function
    Reg.Param i -> R (param_to_reg i)
  | Reg.Reg reg -> R (reg_of reg)
  | Reg.Proc l -> L l
  | Reg.IntV i -> I i

let reg_of_param_or_reg = function
    Reg.Param i -> param_to_reg i
  | Reg.Reg reg -> reg_of reg
  | _ -> err "For debug: this statement cannot be done"


let fresh_label =
  let counter = ref 0 in
  let body str =
    let v = !counter in
    counter := v + 1;
    "LL" ^ str ^ "_" ^ (string_of_int v)
  in
    body

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

let mov_to_ldr stmt =
  match stmt with
    Instr instr ->
     (match instr with
        Mov (reg, addr) ->
         (match addr with 
            I i when (get_max_range (to_binary_str i)) > 8 -> Instr (Ldr (reg, L (string_of_int i)))
          | _ -> stmt)
      | _ -> stmt)
  | _ -> stmt

(* ==== Regマシンコード --> アセンブリコード ==== *)

(* R.decl -> loc list *)
let gen_decl (Reg.ProcDecl (name, nlocal, instrs)) = 
  (* Reg.instr -> stmt list *)
  let gen_instr = function
      Reg.Move (rd, op) -> 
        gen_operand (reg_of rd) op
    | Reg.Load (rd, ofs) ->
        [Instr (Ldr (reg_of rd, (local_access ofs)))]
    | Reg.Store (rd, ofs) ->
        [Instr (Str (reg_of rd, (local_access ofs)))]
    | Reg.BinOp (rd, binOp, op1, op2) ->
        let r1 = reg_of rd in
        let (r2, addr, li, intv_other_flag) =
          match op1, op2 with
            Reg.IntV i1, Reg.IntV i2 -> 
              (A3, I i2, [Instr (Mov (A3, I i1))], false)
          | Reg.IntV i1, _ -> (reg_of_param_or_reg op2, I i1, [], true)
          | _, Reg.IntV i2 -> (reg_of_param_or_reg op1, I i2, [], false)
          | _, _ -> (reg_of_param_or_reg op1, addr_of_rop op2, [], false) in
       (match binOp with
          Plus -> li @ [Instr (Add (r1, r2, addr))]
        | Mult -> 
            li @ 
           (match addr with
              R reg -> [Instr (Mul (r1, r2, reg))]
            | I i -> [Instr (Mov (A4, I i)); Instr (Mul (r1, r2, A4))])
        | Lt ->
            let l1 = fresh_label name in
            let l2 = fresh_label name in
            li @
            (match intv_other_flag with
               true -> [Instr (Mov (A3, addr_of_rop op1));
                        Instr (Cmp (A3, addr_of_rop op2))]
             | false -> [Instr (Cmp (r2, addr))]) @
            [Instr (Blt l1);
             Instr (Mov (r1, I 0));
             Instr (B l2);
             Label l1;
             Instr (Mov (r1, I 1));
             Label l2])
    | Reg.Label label -> [Label label]
    | Reg.BranchIf (op, label) ->
        let (r, li) = 
          match op with
            Reg.IntV i -> (A3, gen_operand A3 op)
          | _ -> (reg_of_param_or_reg op, []) in
        li @
        [Instr (Cmp (r, I 0));
         Instr (Bne label)]
    | Reg.Goto label -> [Instr (B label)]
    | Reg.Call (dest, op_f, [op1; op2]) ->
        [Instr (Str (A1, mem_access Sp 0));
         Instr (Str (A2, mem_access Sp 1))] @
        (gen_operand A1 op1) @
        (gen_operand A2 op2) @
        (match op_f with
           Reg.Proc l -> [Instr (Bl l)]
         | Reg.Reg reg -> [Instr (Blx (reg_of reg))]) @
        (match dest with
           Reg.R reg -> [Instr (Mov (reg_of reg, R A1))]
         | Reg.L ofs -> [Instr (Str (A1, local_access ofs))]) @
        [Instr (Ldr (A1, mem_access Sp 0));
         Instr (Ldr (A2, mem_access Sp 1))]        
    | Reg.Return op ->
        (gen_operand A1 op) @
        [Instr (B (name ^ "_ret"))]
    | Reg.Malloc (dest, size) ->
        [Instr (Str (A1, mem_access Sp 0));
         Instr (Str (A2, mem_access Sp 1));
         Instr (Mov (A1, (I size)));
         Instr (Bl "mymalloc")] @
        (match dest with
           Reg.R reg -> [Instr (Mov (reg_of reg, R A1))]
         | Reg.L ofs -> [Instr (Str (A1, local_access ofs))]) @
        [Instr (Ldr (A1, mem_access Sp 0));
         Instr (Ldr (A2, mem_access Sp 1))]
    | Reg.Assign (dest, i, op) ->
       (match dest with
          Reg.R reg ->
           (match op with
              Reg.Param p -> [Instr (Str (param_to_reg p, mem_access (reg_of reg) i))]
            | Reg.Reg r -> [Instr (Str (reg_of r, mem_access (reg_of reg) i))]
            | _ -> (gen_operand A3 op) @
                   [Instr (Str (A3, mem_access (reg_of reg) i))])
       | Reg.L ofs ->
           [Instr (Ldr (A3, local_access ofs))] @
           (match op with
              Reg.Param p -> [Instr (Str (param_to_reg p, mem_access A3 i))]
            | Reg.Reg r -> [Instr (Str (reg_of r, mem_access A3 i))]
            | _ -> (gen_operand A4 op) @
                   [Instr (Str (A4, mem_access A3 i))]))  
    | Reg.Read (dest, op, i) ->
        let r = reg_of_param_or_reg op in
        match dest with
          Reg.R reg -> 
            [Instr (Ldr (reg_of reg, mem_access r i))]
        | Reg.L ofs ->
            let rd = A3 in
            [Instr (Ldr (rd, mem_access r i));
             Instr (Str (rd, local_access ofs))]
  in
    let instr_list = List.map mov_to_ldr (List.concat (List.map gen_instr instrs)) in
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

let codegen regprog =
  Dir D_text :: List.concat (List.map gen_decl regprog)
