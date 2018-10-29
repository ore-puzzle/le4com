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
    Reg.Param i -> R (param_to_reg)
  | Reg.Reg reg -> R reg
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

(* ==== Regマシンコード --> アセンブリコード ==== *)

(* R.decl -> loc list *)
let gen_decl (Reg.ProcDecl (name, nlocal, instrs)) =
  (* Reg.instr -> stmt list *)
  let gen_instr = function
      Reg.Move (rd, op) -> 
        gen_operand rd op
    | Reg.Load (rd, ofs) ->
        [Instr (Ldr (rd, (local_access ofs)))]
    | Reg.Store (rd, ofs) ->
        [Instr (Str (rd, (local_access ofs)))]
    | Reg.BinOp (rd, binOp, op1, op2) ->
        let r1 = reg_of rd in
        let (r2, addr, li) =
          match op1, op2 with
            Reg.IntV i1, Reg.IntV i2 -> 
              (reg_of Reg.reserved_reg, I i2, gen_operand Reg.reserved_reg op1)
          | Reg.IntV i1, _ -> (reg_of_param_or_reg op2, I i1, [])
          | _, Reg.IntV i2 -> (reg_of_param_or_reg op1, I i2, [])
          | _, _ -> (reg_of_param_or_reg op1, addr_of_rop op2, []) in
       (match binOp with
          Plus -> inst @ [Add (r1, r2, addr)]
        | Mult -> inst @ [Mult (r1, r2, addr)]
        | Lt ->
            let l1 = fresh_label name in
            let l2 = fresh_label name in
            li @
            [Instr (Cmp (r1, R r2));
             Instr (Blt l1);
             Instr (Mov (r1, I 0));
             Instr (B l2);
             Label l1;
             Instr (Mov (r1, I 1));
             Label l2])
    | Reg.Label label -> [Label label]
    | Reg.BranchIf (op, label) ->
        let (r, li) = 
          match op with
            Reg.IntV i-> (reg_of (Reg.reserved_reg), gen_operand Reg.reserved_reg op)
          | _ -> (reg_of_param_or_reg op, []) in
        li @
        [Instr (Cmp (r, I 0));
         Instr (Bne label)]
    | Reg.Goto label -> [Instr (B label)]
    | Reg.Call (dest, op_f, [op1; op2]) ->
        let mov_or_str = 
          match dest with
            Reg.R reg -> gen_operand reg (R A1)
          | Reg.L ofs -> [Instr (Str (A1, local_access ofs))] in
        let r = reg_of_param_or_reg op_f in
        [Instr (Str (A1, mem_access Sp 0));
         Instr (Str (A2, mem_access Sp 1))] @
        (gen_operand A1 op1) @
        (gen_operand A2 op2) @
        [Instr (Blx r)] @
        mov_or_str @
        [Instr (Ldr (A1, mem_access Sp 0));
         Instr (Ldr (A2, mem_access Sp 1))]        
    | Reg.Return op ->
        (gen_operand A1 op) @
        [Instr (B (name ^ "_ret"))]
    | Reg.Malloc (dest, size) ->
        let mov_or_str = 
          match dest with
            Reg.R reg -> [Instr (Mov (reg_of reg, R A1))]
          | Reg.L ofs ->
              let rd = reg_of Reg.reserved_reg in
              [Instr (Mov (rd, R A1));
               Instr (Str (rd, local_access ofs))] in
        [Instr (Str (A1, mem_access Sp 0));
         Instr (Mov (A1, (I size)));
         Instr (Bl "mymalloc")] @
        mov_or_str 
    | Reg.Assign (dest, i, op) ->
       (match op with
          
    | Reg.Read (dest, op, i) ->
        let r = reg_of_param_or_reg op in
        let mov_or_str =
          match dest with
            Reg.R reg -> 
              [Instr (Ldr (reg_of reg, mem_access r i))]
          | Reg.L ofs ->
              let rd = reg_of Reg.reserved_reg in
              [Instr (Ldr (rd, mem_access r i));
               Instr (Str (rd, local_access ofs))]
  in
    let instr_list = List.concat (List.map gen_instr instrs) in
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
