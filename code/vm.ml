module S = Syntax
module F = Flat

exception Error of string
let err s = raise (Error s)

type binOp = S.binOp

type id = int
type label = string

type operand =
    Param of int     (* param(n) *)
  | Local of id      (* local(ofs) *)
  | Proc  of label   (* labimm(l) *)
  | IntV  of int     (* imm(n) *)

type instr =
    Move of id * operand (* local(ofs) <- op *)
  | BinOp of id * S.binOp * operand * operand
    (* local(ofs) <- bop(op_1, op_2) *)
  | Label of label (* l: *)
  | BranchIf of operand * label (* if op then goto l *)
  | Goto of label (* goto l *)
  | Call of id * operand * operand list
    (* local(ofs) <- call op_f(op_1, ..., op_n) *)
  | Return of operand (* return(op) *)
  | Malloc of id * operand list (* new ofs [op_1, ..., op_n] *)
  | Read of id * operand * int (* read ofs #i(op) *)
  | BEGIN of label (* データフロー解析で内部的に使用 *)
  | END of label   (* データフロー解析で内部的に使用 *)

type decl =
    ProcDecl of label * int * instr list  (* int は局所変数の個数 *)

type prog = decl list

(* ==== Formatter ==== *)

let string_of_binop = function
    S.Plus -> "add"
  | S.Mult -> "mul"
  | S.Lt   -> "lt"

let string_of_operand = function
    Param i -> "p" ^ string_of_int i
  | Local o -> (* -1 は生存変数解析で使われる特殊な値 *)
      if o = -1 then "*" else "t" ^ string_of_int o
  | Proc  l -> l
  | IntV  i -> string_of_int i

let string_of_instr idt tab = function
    Move (t, v) ->
      idt ^ "move" ^ tab ^ "t" ^ string_of_int t ^ ", " ^
      string_of_operand v
  | BinOp (t, op, v1, v2) ->
      idt ^ string_of_binop op ^ tab ^ "t" ^ string_of_int t ^ ", " ^
      string_of_operand v1 ^ ", " ^ string_of_operand v2
  | Label lbl -> lbl ^ ":"
  | BranchIf (v, lbl) ->
      idt ^ "bif" ^ tab ^ string_of_operand v ^ ", " ^ lbl
  | Goto lbl ->
      idt ^ "goto" ^ tab ^ lbl
  | Call (dst, tgt, [a0; a1]) ->
      idt ^ "call" ^ tab ^ "t" ^ string_of_int dst ^ ", " ^
      string_of_operand tgt ^
      "(" ^ string_of_operand a0 ^ ", " ^ string_of_operand a1 ^ ")"
  | Call (_, _, args) -> err ("Illegal number of arguments: " ^
                              string_of_int (List.length args))
  | Return v ->
      idt ^ "ret" ^ tab ^ string_of_operand v
  | Malloc (t, vs) ->
      idt ^ "new" ^ tab ^ "t" ^ string_of_int t ^ " [" ^
      (String.concat ", " (List.map string_of_operand vs)) ^ "]"
  | Read (t, v, i) ->
      idt ^ "read" ^ tab ^ "t" ^ string_of_int t ^ " #" ^
      string_of_int i ^ "(" ^ string_of_operand v ^ ")"
  | BEGIN lbl ->
      idt ^ "<BEGIN: " ^ lbl ^ ">"
  | END lbl ->
      idt ^ "<END: " ^ lbl ^ ">"

let string_of_decl (ProcDecl (lbl, n, instrs)) =
  "proc " ^ lbl ^ "(" ^ string_of_int n ^ ") =\n" ^
  (String.concat "\n"
     (List.map (fun i -> string_of_instr "  " "\t" i) instrs)) ^ "\n"

let string_of_vm prog =
  String.concat "\n" (List.map string_of_decl prog)


(* support function *)

let rec gather_id_from_exp = function
    F.CompExp (F.IfExp (_, e1, e2)) ->
      let id_list1 = gather_id_from_exp e1 in
      let id_list2 = gather_id_from_exp e2 in
      id_list1 @ id_list2
  | F.LetExp (id, ce, e)
  | F.LoopExp (id, ce, e) ->
      let id_list1 =
       (match ce with
          F.IfExp (_, e1, e2) ->
            let id_list11 = gather_id_from_exp e1 in
            let id_list12 = gather_id_from_exp e2 in
            id_list11 @ id_list12
        | _ -> []) in
      let id_list2 = gather_id_from_exp e in
      id :: (id_list1 @ id_list2)
  | _ -> []

let make_delta params ids proc_name =
  let rec param_loop params index =
    match params with
      [] -> []
    | head :: rest -> (head, Param index) :: param_loop rest (index+1)
  and id_loop ids index =
    match ids with
      [] -> []
    | head :: rest -> (head, Local index) :: id_loop rest (index+1)
  in
    let tuple_list = (id_loop ids 1) @ (param_loop params 0) in
    let delta var = List.assoc var tuple_list in
    delta

let fresh_label =
  let counter = ref 0 in
  let body str =
    let v = !counter in
    counter := v + 1;
    "L" ^ str ^ "_" ^ (string_of_int v)
  in
    body

(* ==== 仮想機械コードへの変換 ==== *)

let trans_decl (F.RecDecl (proc_name, params, body)) =
  let rec trans_value value delta =
    match value with
      F.Var id -> delta id
    | F.Fun id -> Proc id
    | F.IntV i -> IntV i

  and trans_value_list value_list delta =
    match value_list with
      [] -> []
    | head :: rest -> (trans_value head delta) :: trans_value_list rest delta

  and trans_cexp cexp delta tgt loop_var lbl =
    match cexp with
      F.ValExp v ->
        let op = trans_value v delta in
        [Move (tgt, op)]
    | F.BinOp (binOp, v1, v2) ->
        let op1 = trans_value v1 delta in
        let op2 = trans_value v2 delta in
        [BinOp (tgt, binOp, op1, op2)]
    | F.AppExp (v, v_list) ->
        let op_f = trans_value v delta in
        let ops = trans_value_list v_list delta in
        [Call (tgt, op_f, ops)]
    | F.IfExp (v, e1, e2) ->
        let op = trans_value v delta in
        let l1 = fresh_label proc_name in
        let l2 = fresh_label proc_name in
        let branch = BranchIf (op, l1) in
        let else_case = trans_exp e2 delta tgt loop_var lbl in
        let goto = Goto l2 in
        let label1 = Label l1 in
        let then_case = trans_exp e1 delta tgt loop_var lbl in
        let label2 = Label l2 in
        (branch :: else_case) @ (goto :: label1 :: then_case) @ [label2]
    | F.TupleExp v_list ->
        let ops = trans_value_list v_list delta in
        [Malloc (tgt, ops)]
    | F.ProjExp (v, i) ->
        let op = trans_value v delta in
        [Read (tgt, op, i)] 

  and trans_exp exp delta tgt loop_var lbl =
    match exp with
      F.CompExp ce -> trans_cexp ce delta tgt loop_var lbl
    | F.LetExp (id, ce, e) ->
        let (Local new_tgt) = delta id in
        let bind = trans_cexp ce delta new_tgt loop_var lbl in
        let eval = trans_exp e delta tgt loop_var lbl in
        bind @ eval
    | F.LoopExp (id, ce, e) ->
        let (Local new_tgt) = delta id in
        let bind = trans_cexp ce delta new_tgt loop_var lbl in
        let l = fresh_label proc_name in
        let label = Label l in
        let (Local new_id) = delta id in
        let eval = trans_exp e delta tgt new_id l in
        bind @ (label :: eval)
    | F.RecurExp v ->
        let op = trans_value v delta in
        let subst = Move (loop_var, op) in
        let goto = Goto lbl in
        [subst; goto]
  in
    let ids = gather_id_from_exp body in
    let delta = make_delta params ids proc_name in
    let instrs = trans_exp body delta 0 0 "dummy" in
    ProcDecl (proc_name, (List.length ids) + 1, 
              instrs @ [Return (Local 0)])

(* entry point *)
let trans = List.map trans_decl
