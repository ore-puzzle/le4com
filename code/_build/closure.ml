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
              ((*group ( *)(text "if 0 <")
                      <+> pr_of_value v
                      <+> text "then"
                      <|> pr_of_exp 1 e1))(*)*) <|>
           (nest 2
              ((*group ( *)text "else" <|> pr_of_exp 1 e2)))(*)*)
    | TupleExp vs -> pr_of_values vs
    | ProjExp (v, i) ->
        enclose 2 (pr_of_value v <*> text "." <*> text (string_of_int i))
  and pr_of_exp p e =
    let enclose p' e = if p' < p then text "(" <*> e <*> text ")" else e in
    match e with
      CompExp ce -> pr_of_cexp p ce
    | LetExp (id, ce, e) ->
        enclose 1
          ((nest 2 ((*group ( *)text "let" <+> text id <+>
                           text "=" <|> pr_of_cexp 1 ce))(*)*)
           <+> text "in" <|> pr_of_exp 1 e)
    | LetRecExp (id, parms, body, e) ->
        enclose 1
          ((nest 2 ((*group ( *)text "let" <+> text "rec" <+> text id <+>
                           pr_of_ids parms <+>
                           text "=" <|> pr_of_exp 1 body))(*)*)
           <+> text "in" <|> pr_of_exp 1 e)
    | LoopExp (id, ce, e) ->
        enclose 1
          ((nest 2 ((*group ( *)text "loop" <+> text id <+>
                           text "=" <|> pr_of_cexp 1 ce))(*)*)
           <+> text "in" <|> pr_of_exp 1 e)
    | RecurExp v ->
        enclose 3 (text "recur" <+> pr_of_value v)
  in layout (pretty 40 (pr_of_exp 0 e))


(* ==== support function ==== *)

(* valueの変換 *)
let cvalue_of_nvalue = function
    N.Var id -> Var id
  | N.IntV i -> IntV i

(* cexpの変換 *)
let ccexp_of_ncexp ncexp (f: cexp -> exp) = (* fはAppExpでLetExpが新たに作られるので、それに関して正規形を保つための関数 *)
  match ncexp with
    N.ValExp value -> f (ValExp (cvalue_of_nvalue value))
  | N.BinOp (binOp, v1, v2) -> f (BinOp (binOp, cvalue_of_nvalue v1, cvalue_of_nvalue v2))
  | N.AppExp (Var id, v) ->
      let new_id = "_r_" ^ id in (* クロージャの第０要素を取り出す *)
      LetExp (new_id, ProjExp (Var id, 0), f (AppExp (Var new_id, [Var id; cvalue_of_nvalue v])))
  | N.IfExp _ -> err "For debug: This error must not be raised at closure" (* IfExpはexpをぶら下げていて特別なのでこの関数は呼び出されない *)
  | N.TupleExp (v1, v2) -> f (TupleExp [cvalue_of_nvalue v1; cvalue_of_nvalue v2])
  | N.ProjExp (v, i) -> f (ProjExp (cvalue_of_nvalue v, i - 1)) (* 添字が０からになったのでi-1 *)

(* idを探していく関数群
   decl_idsはletやletrecによって束縛されたidの集合
   var_idsはプログラム中で何らかの形で参照されているidの集合 *)
let gather_id_from_value value (decl_ids, var_ids) =
  match value with
    N.Var id -> (decl_ids, (id :: var_ids))
  | _ -> (decl_ids, var_ids)

(* この関数ではdecl_idsとvar_idsを区別する必要がない（直接idが現れないため）のでid_listとまとめている *)
let rec gather_id_from_cexp cexp id_list =
  match cexp with
    N.ValExp v -> gather_id_from_value v id_list
  | N.BinOp (_, v1, v2)
  | N.AppExp (v1, v2)
  | N.TupleExp (v1, v2) ->
      let (d_ids1, v_ids1) = gather_id_from_value v1 id_list in
      let (d_ids2, v_ids2) = gather_id_from_value v2 id_list in
      (d_ids1 @ d_ids2, v_ids1 @ v_ids2)
  | N.IfExp (v, e1, e2) -> 
      let (d_ids1, v_ids1) = gather_id_from_value v id_list in
      let (d_ids2, v_ids2) = gather_id_from_exp e1 id_list in
      let (d_ids3, v_ids3) = gather_id_from_exp e2 id_list in
      (d_ids1 @ d_ids2 @ d_ids3, v_ids1 @ v_ids2 @ v_ids3)
  | N.ProjExp (v, _) -> gather_id_from_value v id_list

and gather_id_from_exp exp (decl_ids, var_ids) =
  match exp with
    N.CompExp ce -> gather_id_from_cexp ce (decl_ids, var_ids)
  | N.LetExp (id, ce, e) 
  | N.LoopExp (id, ce, e) -> 
      let (d_ids1, v_ids1) = gather_id_from_cexp ce (decl_ids, var_ids) in
      let (d_ids2, v_ids2) = gather_id_from_exp e (decl_ids, var_ids) in
      (id :: d_ids1 @ d_ids2, v_ids1 @ v_ids2)
  | N.LetRecExp (id1, id2, e1, e2) -> 
      let (d_ids1, v_ids1) = gather_id_from_exp e1 (decl_ids, var_ids) in
      let (d_ids2, v_ids2) = gather_id_from_exp e2 (decl_ids, var_ids) in
      ([id1; id2] @ d_ids1 @ d_ids2, v_ids1 @ v_ids2) 
  | N.RecurExp v -> gather_id_from_value v (decl_ids, var_ids)

(* list中から重複を除いたlistを返す *)
let rec delete_duplication input_l output_l =
  match input_l with
    [] -> List.rev output_l
  | head :: rest -> if List.mem head output_l then delete_duplication rest output_l
                    else delete_duplication rest (head :: output_l)

(* リストlから要素eを取り除く
   複数存在する場合は最も先頭に現れるものを取り除く *)
let rec remove e l =
  match l with
    [] -> []
  | head :: rest -> if e = head then rest
                    else head :: (remove e rest)

(* l1-l2を返す *)
let rec diff l1 l2 =
  match l2 with
    [] -> l1
  | head :: rest -> if List.mem head l1 then diff (remove head l1) rest
                    else diff l1 rest

(* idにVarをつけてvalueにする *)
let rec var_of_id = function
    [] -> []
  | head :: rest -> (Var head) :: var_of_id rest

(* クロージャを表すタプルに引数を加えるための関数 *)
let add_to_closure (TupleExp l) input_l = TupleExp (l @ input_l)

    
  
(* entry point *)
let convert exp =
  let rec body_loop exp (f: exp -> exp) =
    match exp with
      N.CompExp ce ->
       (match ce with
          N.IfExp (v, e1, e2) -> f (CompExp (IfExp (cvalue_of_nvalue v, body_loop e1 f, body_loop e2 f)))
        | _ -> f (ccexp_of_ncexp ce (fun ce -> CompExp ce)))
    | N.LetExp (id, ce, e) ->
       (match ce with
          N.IfExp (v, e1, e2) -> f (LetExp (id, IfExp (cvalue_of_nvalue v, body_loop e1 f, body_loop e2 f), body_loop e (fun e -> e)))
        | _ -> f (ccexp_of_ncexp ce (fun ce' -> LetExp (id, ce', body_loop e (fun e -> e)))))
    | N.LetRecExp (id1, id2, e1, e2) ->
        (* idを集める *)
        let (decl_id_list, var_id_list) = gather_id_from_exp e1 ([id1; id2], []) in
        (* idの重複をなくす *)
        let (decl_id_set, var_id_set) = (delete_duplication decl_id_list [], delete_duplication var_id_list []) in
        (* var_id_set - decl_id_set をすることで自由変数のidを取り出す *)
        let free_var_id = diff var_id_set decl_id_set in
        (* 自由変数のidにVarをつけてvalueにする *)
        let free_var = var_of_id free_var_id in
        (* 関数名のリネーム *)
        let new_id = "_b_" ^ id1 in
        (* 関数ポインタのみを持ったクロージャを作る *)
        let closure = TupleExp [Var new_id] in
        (* 自由変数がないなら *)
        if List.length free_var = 0 then
          (* 本体式をクロージャ変換して *)
          let converted = body_loop e1 f in
          (* 元の関数名にクロージャを束縛 *)
          f (LetRecExp (new_id, [id1; id2], converted, LetExp (id1, closure, body_loop e2 (fun e -> e))))
        (* 自由変数があるなら *)
        else
          (* 自由変数をクロージャから取り出して束縛するlet式の列を構成するような関数 *)
          let rec make_function id index f_var =
            match f_var with (* ここに来ている時点でf_varは空ではない *)
              [v] -> fun e -> LetExp (v, ProjExp (Var id, index), e)
            | head :: rest -> 
                let func1 = fun e -> LetExp (head, ProjExp (Var id, index), e) in
                let func2 = make_function id (index+1) rest in
                (* func1とfunc2の合成関数を返す *)
                let composed_func e = func1 (func2 e) in
                composed_func
          in
            (* 自由変数を束縛するlet式の列が並んで、最後のlet式のinの後にexpを埋め込むような関数を作る *)
            let new_func = make_function id1 1 free_var_id in
            (* そんな関数にletrec式の本体式を突っ込む *)
            let converted = body_loop e1 new_func in (* fを恒等関数でない関数に束縛するのはここだけ *)
            (* クロージャに自由変数を付け加えておく *)
            f (LetRecExp (new_id, [id1; id2], converted, LetExp (id1, add_to_closure closure free_var, body_loop e2 (fun e -> e))))
    | N.LoopExp (id, ce, e) ->
       (match ce with
          N.IfExp (v, e1, e2) -> f (CompExp (IfExp (cvalue_of_nvalue v, body_loop e1 f, body_loop e2 f)))
        | _ -> f (ccexp_of_ncexp ce (fun ce' -> LoopExp (id, ce', body_loop e (fun e -> e)))))
    | N.RecurExp v -> f (RecurExp (cvalue_of_nvalue v))
  in
    body_loop exp (fun e -> e)
  
