open Pretty
module S = Syntax

exception Error of string
let err s = raise (Error s)

type id = S.id
type binOp = S.binOp

let fresh_id = Misc.fresh_id_maker "_"

(* ==== 値 ==== *)
type value =
    Var  of id
  | IntV of int

(* ==== 式 ==== *)
type cexp =
    ValExp    of value
  | BinOp     of binOp * value * value
  | AppExp    of value * value
  | IfExp     of value * exp * exp
  | TupleExp  of value * value
  | ProjExp   of value * int

and exp =
    CompExp   of cexp
  | LetExp    of id * cexp * exp
  | LetRecExp of id * id * exp * exp
  | LoopExp   of id * cexp * exp
  | RecurExp  of value

(* ==== Formatter ==== *)

let string_of_norm e =
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
  let rec pr_of_cexp p e =
    let enclose p' e = if p' < p then text "(" <*> e <*> text ")" else e in
    match e with
      ValExp v -> pr_of_value v
    | BinOp (op, v1, v2) ->
        enclose 2 (pr_of_value v1 <+> pr_of_op op <+> pr_of_value v2)
    | AppExp (f, v) ->
        enclose 3 (pr_of_value f <+> pr_of_value v)
    | IfExp (v, e1, e2) ->
        enclose 1
          ((nest 2
              (group ((text "if 0 <")
                      <+> pr_of_value v
                      <+> text "then"
                      <|> pr_of_exp 1 e1))) <|>
           (nest 2
              (group (text "else" <|> pr_of_exp 1 e2))))
    | TupleExp (v1, v2) ->
        text "(" <*> pr_of_value v1 <*> text ","
        <+> pr_of_value v2 <*> text ")"
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
    | LetRecExp (id, v, body, e) ->
        enclose 1
          ((nest 2 (group (text "let" <+> text "rec" <+>
                           text id <+> text v <+>
                           text "=" <|> pr_of_exp 1 body)))
           <+> text "in" <|> pr_of_exp 1 e)
    | LoopExp (id, ce, e) ->
        enclose 1
          ((nest 2 (group (text "loop" <+> text id <+>
                           text "=" <|> pr_of_cexp 1 ce)))
           <+> text "in" <|> pr_of_exp 1 e)
    | RecurExp v ->
        enclose 3 (text "recur" <+> pr_of_value v)
  in layout (pretty 30 (pr_of_exp 0 e))

(* === support function === *)

(* 資料にあった関数 *)
let vk k ce = 
  match ce with
    ValExp value -> k value
  | _ -> 
      let v = fresh_id "v" in LetExp (v, ce, k (Var v))

(* freshなidを作成 *)
let make_new_id id =
  if id.[0] = '$' then
    let [name; suffix] = String.split_on_char '#' id in
    name ^ "#" ^ string_of_int ((int_of_string suffix) + 1)
  else
    "$" ^ id ^ "#0"

(* exp中のすべてのidをnew_idに置き換える *)
let rename exp id new_id =
  let rec body_loop exp =
    match exp with
      S.Var id' when id = id' -> S.Var new_id
    | S.BinOp (binOp, e1, e2) -> S.BinOp (binOp, body_loop e1, body_loop e2)
    | S.IfExp (e1, e2, e3) -> S.IfExp (body_loop e1, body_loop e2, body_loop e3)
    | S.LetExp (id', e1, e2) -> 
        if id = id' then S.LetExp (new_id, body_loop e1, body_loop e2)
        else S.LetExp (id', body_loop e1, body_loop e2)
    | S.AppExp (e1, e2) -> S.AppExp (body_loop e1, body_loop e2)
    | S.LetRecExp (id1, id2, e1, e2) ->
        if id = id1 then S.LetRecExp (new_id, id2, body_loop e1, body_loop e2)
        else S.LetRecExp (id1, id2, body_loop e1, body_loop e2)
    | S.LoopExp (id', e1, e2) ->
        if id = id' then S.LoopExp (new_id, body_loop e1, body_loop e2)
        else S.LoopExp (id', body_loop e1, body_loop e2)
    | S.RecurExp e -> S.RecurExp (body_loop e)
    | S.TupleExp (e1, e2) -> S.TupleExp (body_loop e1, body_loop e2)
    | S.ProjExp (e, i) -> S.ProjExp (body_loop e, i)
    | _ -> exp
  in
    body_loop exp

(* すでに束縛されている変数を束縛しようとしているlet,let rec式を見つけてrename関数を呼び出す *)
let rec preprocess exp id_list = (* id_listは束縛されているidの集合 *)
  match exp with
      S.BinOp (binOp, e1, e2) -> 
        S.BinOp (binOp, preprocess e1 id_list, preprocess e2 id_list)
    | S.IfExp (e1, e2, e3) -> 
        S.IfExp (preprocess e1 id_list, preprocess e2 id_list, preprocess e3 id_list)
    | S.LetExp (id, e1, e2) -> 
        if List.mem id id_list then 
          let new_id = make_new_id id in
          S.LetExp (new_id, preprocess e1 id_list, preprocess (rename e2 id new_id) (new_id :: id_list))
        else
          S.LetExp (id, preprocess e1 id_list, preprocess e2 (id :: id_list))
    | S.AppExp (e1, e2) -> S.AppExp (preprocess e1 id_list, preprocess e2 id_list)
    | S.LetRecExp (id1, id2, e1, e2) ->
        if List.mem id1 id_list then 
          let new_id = make_new_id id1 in
          let S.LetRecExp (id1', id2', e1', e2') = rename exp id1 new_id in
          S.LetRecExp (id1', id2', preprocess e1' (id1' :: id2' :: id_list), preprocess e2' (id1' :: id_list))
        else 
          S.LetRecExp (id1, id2, preprocess e1 (id1 :: id2 :: id_list), preprocess e2 (id1 :: id_list))
    | S.LoopExp (id, e1, e2) ->
        if List.mem id id_list then 
          let new_id = make_new_id id in
          S.LoopExp (new_id, preprocess e1 id_list, preprocess (rename e2 id new_id) (new_id :: id_list))
        else
          S.LoopExp (id, preprocess e1 id_list, preprocess e2 (id :: id_list))
    | S.RecurExp e -> S.RecurExp (preprocess e id_list)
    | S.TupleExp (e1, e2) -> S.TupleExp (preprocess e1 id_list, preprocess e2 id_list)
    | S.ProjExp (e, i) -> S.ProjExp (preprocess e id_list, i)
    | _ -> exp
    

(* ==== 正規形への変換 ==== *)

let rec norm_exp (e: Syntax.exp) (f: cexp -> exp) = match e with
    S.Var id -> f (ValExp (Var id))
  | S.ILit i -> f (ValExp (IntV i))
  | S.BLit true -> f (ValExp (IntV 1))
  | S.BLit false -> f (ValExp (IntV 0))
   | S.BinOp (binOp, e1, e2) ->
     (* 本来は関数vkですることを、手作業で行っている. AppExp,TupleExpも同様 *)
     (match e2 with
        S.Var id -> let k = fun v -> f (BinOp (binOp, v, Var id)) in norm_exp e1 (vk k)
      | S.ILit i -> let k = fun v -> f (BinOp (binOp, v, IntV i)) in norm_exp e1 (vk k)
      | S.BLit true -> let k = fun v -> f (BinOp (binOp, v, IntV 1)) in norm_exp e1 (vk k)
      | S.BLit false -> let k = fun v -> f (BinOp (binOp, v, IntV 0)) in norm_exp e1 (vk k)
      | _ -> 
          let v2 = fresh_id "v" in
          let k = fun v -> (norm_exp e2 (fun ce -> LetExp (v2, ce, f (BinOp (binOp, v, Var v2))))) in
          norm_exp e1 (vk k))
  | S.IfExp (e1, e2, e3) ->
      let k = fun v -> f (IfExp (v, norm_exp e2 (fun ce -> CompExp ce), norm_exp e3 (fun ce -> CompExp ce))) in
      norm_exp e1 (vk k)
  | S.LetExp (id, e1, e2) ->
      norm_exp e1 (fun ce -> LetExp (id, ce, norm_exp e2 f))
  | S.FunExp (id, e') ->
      let f' = fresh_id "f" in
      let letrecexp = S.LetRecExp (f', id, e', S.Var f') in (* CではなくSのLetRecExpに変換してからnorm_expする *)
      norm_exp letrecexp f
  | S.AppExp (e1, e2) ->
      (match e2 with
        S.Var id -> let k = fun v -> f (AppExp (v, Var id)) in norm_exp e1 (vk k)
      | S.ILit i -> let k = fun v -> f (AppExp (v, IntV i)) in norm_exp e1 (vk k)
      | S.BLit true -> let k = fun v -> f (AppExp (v, IntV 1)) in norm_exp e1 (vk k)
      | S.BLit false -> let k = fun v -> f (AppExp (v, IntV 0)) in norm_exp e1 (vk k)
      | _ -> 
          let v2 = fresh_id "v" in
          let k = fun v -> (norm_exp e2 (fun ce -> LetExp (v2, ce, f (AppExp (v, Var v2))))) in
          norm_exp e1 (vk k))
  | S.LetRecExp (id1, id2, e1, e2) ->
      LetRecExp (id1, id2, norm_exp e1 (fun ce -> CompExp ce), norm_exp e2 f)
  | S.LoopExp (id, e1, e2) ->
      norm_exp e1 (fun ce -> LoopExp (id, ce, norm_exp e2 f))
  | S.RecurExp e' ->
      let k = fun v -> RecurExp v in
      norm_exp e' (vk k)
  | S.TupleExp (e1, e2) ->
      (match e2 with
        S.Var id -> let k = fun v -> f (TupleExp(v, Var id)) in norm_exp e1 (vk k)
      | S.ILit i -> let k = fun v -> f (TupleExp(v, IntV i)) in norm_exp e1 (vk k)
      | S.BLit true -> let k = fun v -> f (TupleExp(v, IntV 1)) in norm_exp e1 (vk k)
      | S.BLit false -> let k = fun v -> f (TupleExp(v, IntV 0)) in norm_exp e1 (vk k)
      | _ -> 
          let v2 = fresh_id "v" in
          let k = fun v -> (norm_exp e2 (fun ce -> LetExp (v2, ce, f (TupleExp(v, Var v2))))) in
          norm_exp e1 (vk k))
  | S.ProjExp (e', i) ->
      if i != 1 && i != 2 then
        err "Error: only permit <v>.1 or <v>.2"  (* セマンティクス上でのエラー *)
      else
        let k = fun v -> f (ProjExp (v, i)) in
        norm_exp e' (vk k)

and normalize e = norm_exp e (fun ce -> CompExp ce)

(* ==== entry point ==== *)
let convert prog =
  let preprocessed_prog = preprocess prog [] in (* すでに束縛されている変数を再束縛している場合,フレッシュな名前に変えておく *)
  normalize preprocessed_prog


