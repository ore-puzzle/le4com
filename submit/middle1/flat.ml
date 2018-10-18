open Pretty
module S = Syntax
module C = Closure

exception Error of string
let err s = raise (Error s)

type id = S.id
type binOp = S.binOp

(* ==== 値 ==== *)
type value =
    Var  of id
  | Fun  of id   (* NEW *)
  | IntV of int

(* ==== 式 ==== *)
type cexp =
    ValExp    of value
  | BinOp     of binOp * value * value
  | AppExp    of value * value list
  | IfExp     of value * exp * exp
  | TupleExp  of value list
  | ProjExp   of value * int

and exp =
    CompExp   of cexp
  | LetExp    of id * cexp * exp
  | LoopExp   of id * cexp * exp
  | RecurExp  of value

(* ==== 関数宣言 ==== *)
type decl = RecDecl of id * id list * exp  (* NEW *)

(* ==== プログラム ==== *)
type prog = decl list  (* NEW *)

(* ==== Formatter ==== *)

let string_of_flat prog =
  let pr_of_op = function
      S.Plus -> text "+"
    | S.Mult -> text "*"
    | S.Lt -> text "<" in
  let pr_of_value = function
      Var id -> text id
    | Fun id -> text "#'" <*> text id
    | IntV i ->
        let s = text (string_of_int i) in
        if i < 0 then text "(" <*> s <*> text ")" else s
  in
  let pr_of_values = function
      [] -> text "()"
    | v :: vs' ->
        text "(" <*>
        (List.fold_left
           (fun d v -> d <*> text "," <+> pr_of_value v)
           (pr_of_value v) vs')
        <*> (text ")")
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
    | LoopExp (id, ce, e) ->
        enclose 1
          ((nest 2 (group (text "loop" <+> text id <+>
                           text "=" <|> pr_of_cexp 1 ce)))
           <+> text "in" <|> pr_of_exp 1 e)
    | RecurExp v ->
        enclose 3 (text "recur" <+> pr_of_value v)
  in
  let pr_of_decl = function
      RecDecl (id, params, body) ->
        let tparms = match params with
            [] -> text ""
          | param :: params' ->
              List.fold_left (fun t p -> t <*> text "," <+> text p)
                (text param) params'
        in
        (group (text "let" <+> text "rec" <+>
                (group
                   ((text id) <+> text "(" <*> tparms <*> text ")" <+>
                    nest 2 (text "=" <|> pr_of_exp 1 body)))))
  in
  layout
    (pretty 30 (List.fold_right (fun decl doc ->
         pr_of_decl decl <|> nil <|> doc) prog nil))


(* support function *)

let rec fvalue_of_cvalue cvalue env =
    match cvalue with
      C.Var id -> 
       (try
          Environment.lookup id env
        with
          Environment.Not_bound -> err ("Error: " ^ id ^ " id not bound"))
    | C.IntV i -> IntV i

let rec fvalue_list_of_cvalue_list cvalue_list env =
  match cvalue_list with
    [] -> []
  | head :: rest -> (fvalue_of_cvalue head env) :: fvalue_list_of_cvalue_list rest env 

let rec fcexp_of_ccexp ccexp env =
    match ccexp with
      C.ValExp v -> ValExp (fvalue_of_cvalue v env)
    | C.BinOp (binOp, v1, v2) -> BinOp (binOp, fvalue_of_cvalue v1 env, fvalue_of_cvalue v2 env)
    | C.AppExp (v, v_list) -> AppExp (fvalue_of_cvalue v env, fvalue_list_of_cvalue_list v_list env)
    | C.IfExp _ -> err "For debug: This error must not be raised at flat"
    | C.TupleExp v_list -> TupleExp (fvalue_list_of_cvalue_list v_list env)
    | C.ProjExp (v, i) -> ProjExp (fvalue_of_cvalue v env, i)

let rec extend_env_by_id_list id_list env =
  match id_list with
    [] -> env
  | head :: rest -> 
      let new_env = Environment.extend head (Var head) env in
      extend_env_by_id_list rest new_env   

(* ==== フラット化：変数参照と関数参照の区別も同時に行う ==== *)

let flatten exp =
  let rec body_loop exp env : (exp * decl list) =
    match exp with
      C.CompExp ce -> 
       (match ce with
          C.IfExp (v, e1, e2) ->
            let (new_exp1, new_decl_list1) = body_loop e1 env in
            let (new_exp2, new_decl_list2) = body_loop e2 env in
            (CompExp (IfExp (fvalue_of_cvalue v env, new_exp1, new_exp2)), new_decl_list1 @ new_decl_list2)
        | _ -> (CompExp (fcexp_of_ccexp ce env), []))
    | C.LetExp (id, ce, e) ->
       let new_env = Environment.extend id (Var id) env in
       let (new_exp, new_decl_list) = body_loop e new_env in
        (match ce with
           C.IfExp (v, e1, e2) ->
             let (new_exp1, new_decl_list1) = body_loop e1 env in
             let (new_exp2, new_decl_list2) = body_loop e2 env in
             (LetExp (id, IfExp ((fvalue_of_cvalue v env), new_exp1, new_exp2), new_exp), new_decl_list1 @ new_decl_list2)
         | _ -> (LetExp (id, fcexp_of_ccexp ce env, new_exp), new_decl_list))
    | C.LetRecExp (id, id_list, e1, e2) -> 
        let new_env1 = extend_env_by_id_list id_list env in
        let new_env2 = Environment.extend id (Fun id) env in
        let (new_exp1, new_decl_list1) = body_loop e1 new_env1 in
        let (new_exp2, new_decl_list2) = body_loop e2 new_env2 in
        (new_exp2, (RecDecl (id, id_list, new_exp1)) :: (new_decl_list1 @ new_decl_list2))
    | C.LoopExp (id, ce, e) ->
        let new_env = Environment.extend id (Var id) env in
        let (new_exp, new_decl_list) = body_loop e new_env in
         (match ce with
            C.IfExp (v, e1, e2) ->
              let (new_exp1, new_decl_list1) = body_loop e1 env in
              let (new_exp2, new_decl_list2) = body_loop e2 env in
              (LoopExp (id, IfExp ((fvalue_of_cvalue v env), new_exp1, new_exp2), new_exp), new_decl_list1 @ new_decl_list2)
          | _ -> (LoopExp (id, fcexp_of_ccexp ce env, new_exp), new_decl_list))
    | C.RecurExp v -> (RecurExp (fvalue_of_cvalue v env), [])
  in
    let (rest_exp, decl_list) = body_loop exp Environment.empty in
    decl_list @ [(RecDecl ("_toplevel", ["p0"; "p1"], rest_exp))]
