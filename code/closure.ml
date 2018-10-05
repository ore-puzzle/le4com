open Pretty
module S = Syntax
module N = Normal

exception Error of string
let err s = raise (Error s)

type id = S.id
type binOp = S.binOp

let fresh_id = N.fresh_id

(* ==== 値 ==== *)
type value =
    Var  of id
  | IntV of int

(* ==== 式 ==== *)
type cexp =
    ValExp    of value
  | BinOp     of binOp * value * value
  | AppExp    of value * value list     (* NEW *)
  | IfExp     of value * exp * exp
  | TupleExp  of value list             (* NEW *)
  | ProjExp   of value * int

and exp =
    CompExp   of cexp
  | LetExp    of id * cexp * exp
  | LetRecExp of id * id list * exp * exp  (* NEW *)
  | LoopExp   of id * cexp * exp
  | RecurExp  of value

(* ==== Formatter ==== *)

let string_of_closure e =
  let pr_of_op = function
      S.Plus -> text "+"
    | S.Mult -> text "*"
    | S.Lt -> text "<" in
  let pr_of_value = function
      Var id -> text id
    | IntV i ->
        let s = text (string_of_int i) in
        if i < 0 then text "(" <*> s <*> text ")" else s
  in
  let pr_of_values = function
      [] -> text "()"
    | v :: vs' ->
        (text "(" <*>
         (List.fold_left
            (fun d v -> d <*> text "," <+> pr_of_value v)
            (pr_of_value v) vs')
         <*> (text ")"))
  in
  let pr_of_ids = function
      [] -> text "()"
    | id :: ids' ->
        (text "(" <*>
         (List.fold_left
            (fun d i -> d <*> text "," <+> text i)
            (text id) ids')
         <*> (text ")"))
  in
  let rec pr_of_cexp p e =
    let enclose p' e = if p' < p then text "(" <*> e <*> text ")" else e in
    match e with
      ValExp v -> pr_of_value v
    | BinOp (op, v1, v2) ->
        enclose 2 (pr_of_value v1 <+> pr_of_op op <+> pr_of_value v2)
    | AppExp (f, vs) ->
        enclose 3 (pr_of_value f <+> pr_of_values vs)
    | IfExp (v, e1, e2) ->
        enclose 1
          ((nest 2
              (group ((text "if 0 <")
                      <+> pr_of_value v
                      <+> text "then"
                      <|> pr_of_exp 1 e1))) <|>
           (nest 2
              (group (text "else" <|> pr_of_exp 1 e2))))
    | TupleExp vs -> pr_of_values vs
    | ProjExp (v, i) ->
        enclose 2 (pr_of_value v <*> text "." <*> text (string_of_int i))
  and pr_of_exp p e =
    let enclose p' e = if p' < p then text "(" <*> e <*> text ")" else e in
    match e with
      CompExp ce -> pr_of_cexp p ce
    | LetExp (id, ce, e) ->
        enclose 1
          ((nest 2 (group (text "let" <+> text id <+>
                           text "=" <|> pr_of_cexp 1 ce)))
           <+> text "in" <|> pr_of_exp 1 e)
    | LetRecExp (id, parms, body, e) ->
        enclose 1
          ((nest 2 (group (text "let" <+> text "rec" <+> text id <+>
                           pr_of_ids parms <+>
                           text "=" <|> pr_of_exp 1 body)))
           <+> text "in" <|> pr_of_exp 1 e)
    | LoopExp (id, ce, e) ->
        enclose 1
          ((nest 2 (group (text "loop" <+> text id <+>
                           text "=" <|> pr_of_cexp 1 ce)))
           <+> text "in" <|> pr_of_exp 1 e)
    | RecurExp v ->
        enclose 3 (text "recur" <+> pr_of_value v)
  in layout (pretty 40 (pr_of_exp 0 e))


(* convert support function *)
let cvalue_of_nvalue = function
    N.Var id -> Var id
  | N.IntV i -> IntV i

let ccexp_of_ncexp = function
    N.ValExp value -> ValExp (cvalue_of_nvalue value)
  | N.BinOp (binOp, v1, v2) -> BinOp (binOp, cvalue_of_nvalue v1, cvalue_of_nvalue v2)
  | N.AppExp (v1, v2) -> AppExp (cvalue_of_nvalue v1, [cvalue_of_nvalue v2])
  | N.IfExp (v, e1, e2) -> err "For debug: This error must not be raised"
  | N.TupleExp (v1, v2) -> TupleExp [cvalue_of_nvalue v1; cvalue_of_nvalue v2]
  | N.ProjExp (v, i) -> ProjExp (cvalue_of_nvalue v, i)

(*let rec freevar (t: N.exp) id_list : MySet.t =
  match t with*)

let gather_id_from_value value (l: id list list) =
  match value with
    N.Var id -> 
  | _ -> []

let rec gather_id_from_cexp = function
    N.ValExp v -> gather_id_from_value v
  | N.BinOp (_, v1, v2)
  | N.AppExp (v1, v2)
  | N.TupleExp (v1, v2) -> (gather_id_from_value v1) @ (gather_id_from_value v2)
  | N.IfExp (v, e1, e2) -> (gather_id_from_value v) @ (gather_id_from_exp e1) @ (gather_id_from_exp e2)
  | N.ProjExp (v, _) -> gather_id_from_value v

and gather_id_from_exp = function
    N.CompExp ce -> gather_id_from_cexp ce
  | N.LetExp (id, ce, e) 
  | N.LoopExp (id, ce, e) -> id :: (gather_id_from_cexp ce) @ (gather_id_from_exp e)
  | N.LetRecExp (id1, id2, e1, e2) -> [id1; id2] @ (gather_id_from_exp e1) @ (gather_id_from_exp e2)
  | N.RecurExp v -> gather_id_from_value v
  

(* entry point *)
let convert exp =  CompExp (ValExp (IntV 1)) 
 (* let rec not_func_loop exp =
    match exp with
      N.CompExp ce ->
       (match ce with
          N.IfExp (v, e1, e2) -> CompExp (IfExp (cvalue_of_nvalue v, not_func_loop e1, not_func_loop e2))
        | _ -> CompExp (ccexp_of_ncexp ce))
    | N.LetExp (id, ce, e)
    | N.LoopExp (id, ce, e) ->
        let ce' =
         (match ce with
            N.IfExp (v, e1, e2) -> IfExp (cvalue_of_nvalue v, not_func_loop e1, not_func_loop e2)
          | _ -> ccexp_of_ncexp ce) in
        LetExp (id, ce', not_func_loop e)
    | N.LetRecExp _ -> in_func_loop exp (...)
    | N.RecurExp v -> RecurExp (cvalue_of_nvalue v)
  and in_func_loop exp f =
    match exp with
      N.CompExp ce -> 
    | N.LetExp (id, ce, e) -> 
    | N.LetRecExp (id1, id2, e1, e2) ->
    | N.LoopExp (id, ce, e) ->
    | N.RecurExp v ->
  in
    not_func_loop exp (fun x -> x)*)
  
