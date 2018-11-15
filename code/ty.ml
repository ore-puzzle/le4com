open Syntax

type tyvar = int

type ty =
    TyInt
  | TyBool
  | TyVar of tyvar
  | TyFun of ty * ty
  | TyRecur
  | TyTuple of ty * ty

type subst = (tyvar * ty) list

let err s = raise (Error s)

let alphabet_of_0to25 i = 
  if i >= 0 && i <= 25 then Char.escaped (char_of_int (i + 97))
  else "error"

let string_of_num num =
  let mod26 = num mod 26 in
  let quo26 = num / 26 in
  let alphabet = alphabet_of_0to25 mod26 in
  let suffix = if quo26 = 0 then "" else string_of_int quo26 in
  "'" ^ alphabet ^ suffix

let make_tyvar_string_list ty =
  let counter = ref 0 in
  let rec body_func ty ts_list =
    let num = !counter in
    match ty with
      TyInt
    | TyBool
    | TyRecur -> ts_list
    | TyVar tyvar ->
        if List.mem_assoc tyvar ts_list then ts_list
        else (counter := num + 1; (tyvar, string_of_num num) :: ts_list)
    | TyFun (domty, ranty) ->
        let domty_ts_list = body_func domty ts_list in
        let ranty_ts_list = body_func ranty domty_ts_list in
        domty_ts_list @ ranty_ts_list
    | TyTuple (ty1, ty2) ->
        let ty1_ts_list = body_func ty1 ts_list in
        let ty2_ts_list = body_func ty2 ty1_ts_list in
        ty1_ts_list @ ty2_ts_list
  in
    body_func ty []
         

let rec string_of_ty ty =
  let tyvar_string_list = make_tyvar_string_list ty in
  let rec body_func ty =
    match ty with
      TyInt -> "int"
    | TyBool -> "bool"
    | TyVar tyvar -> List.assoc tyvar tyvar_string_list
    | TyFun (TyFun (_, _) as domty, ranty) -> "(" ^ (body_func domty) ^ ")" ^
                                              " -> " ^ (body_func ranty)
    | TyFun (domty, ranty) -> (body_func domty) ^ " -> " ^ (body_func ranty)
    | TyTuple (ty1, ty2) -> "(" ^ (body_func ty1) ^ " * " ^ (body_func ty2) ^ ")"
  in
    body_func ty

let fresh_tyvar =
  let counter = ref 0 in
  let body () =
    let v = !counter in
      counter := v + 1; v
  in body  

let rec freevar_ty ty = 
  match ty with
    TyInt
  | TyBool 
  | TyRecur -> MySet.empty
  | TyVar tyvar -> MySet.singleton tyvar
  | TyFun (domty, ranty) -> MySet.union (freevar_ty domty) (freevar_ty ranty)
  | TyTuple (ty1, ty2) -> MySet.union (freevar_ty ty1) (freevar_ty ty2)

let rec subst_type (subst : subst) t =
  let rec subst_one_type (tv, ty) t =
    match t with
      TyVar tv' when tv = tv' -> ty
    | TyFun (domty, ranty) -> TyFun (subst_one_type (tv, ty) domty, subst_one_type (tv, ty) ranty)
    | TyTuple (ty1, ty2) -> TyTuple (subst_one_type (tv, ty) ty1, subst_one_type (tv, ty) ty2)
    | _ -> t
  in
    match subst with
      [] -> t
    | head :: rest -> subst_type rest (subst_one_type head t)

let rec eqs_of_subst (s : subst) =
  match s with
    [] -> []
  | (tyvar, ty) :: rest -> (TyVar tyvar, ty) :: (eqs_of_subst rest)

let rec subst_eqs (s : subst) eqs =
  match eqs with
    [] -> []
  | (ty1, ty2) :: rest -> (subst_type s ty1, subst_type s ty2) :: subst_eqs s rest

let rec unify = function
    [] -> []
  | (ty1, ty2) :: rest ->
     (match ty1, ty2 with
        x, y when x = y -> unify rest
      | TyFun (dty1, rty1), TyFun (dty2, rty2) -> unify ((dty1, dty2) :: (rty1, rty2) :: rest)
      | TyTuple (ty11, ty12), TyTuple (ty21, ty22) -> unify ((ty11, ty21) :: (ty12, ty22) :: rest)
      | TyRecur, _ | _, TyRecur -> unify rest
      | TyVar alpha, _ ->
          if MySet.member alpha (freevar_ty ty2) then err ("Type error: cannot unify")
          else (alpha, ty2) :: unify (subst_eqs [(alpha, ty2)] rest)
      | _, TyVar alpha ->
          if MySet.member alpha (freevar_ty ty1) then err ("Type error: cannot unify")
          else (alpha, ty1) :: unify (subst_eqs [(alpha, ty1)] rest)
      | _ -> err ("Type error: cannot unify " ^ string_of_ty ty1 ^ " = " ^ string_of_ty ty2))

let ty_prim op ty1 ty2 = match op with
    Plus -> ([(ty1, TyInt); (ty2, TyInt)], TyInt)
  | Mult -> ([(ty1, TyInt); (ty2, TyInt)], TyInt)
  | Lt -> ([(ty1, TyInt); (ty2, TyInt)], TyBool)


let rec ty_exp tyenv loop_id = function
    Var x ->
     (try
        let ty = Environment.lookup x tyenv in
        ([], ty)
      with Environment.Not_bound -> err ("Error: variable not bound: " ^ x))
  | ILit i -> ([], TyInt)
  | BLit b -> ([], TyBool)
  | BinOp (binOp, exp1, exp2) ->
      let (s1, ty1) = ty_exp tyenv loop_id exp1 in
      let (s2, ty2) = ty_exp tyenv loop_id exp2 in
      let (eqs3, ty) =  ty_prim binOp ty1 ty2 in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) @ eqs3 in
      let s3 = unify eqs in
      (s3, subst_type s3 ty)
  | IfExp (exp1, exp2, exp3) ->
      let (s1, ty1) = ty_exp tyenv loop_id exp1 in
      let (s2, ty2) = ty_exp tyenv loop_id exp2 in
      let (s3, ty3) = ty_exp tyenv loop_id exp3 in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) @ (eqs_of_subst s3) @ [(ty1, TyBool); (ty2, ty3)] in
      let s4 = unify eqs in
      (s4, subst_type s4 ty2)
  | LetExp (id, exp1, exp2) ->
      let (s1, ty1) = ty_exp tyenv loop_id exp1 in
      let newtyenv = Environment.extend id ty1 tyenv in
      let (s2, ty2) = ty_exp newtyenv loop_id exp2 in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) in
      let s3 = unify eqs in
      (s3, subst_type s3 ty2)
  | FunExp (id, exp) ->
      let domty = TyVar (fresh_tyvar ()) in
      let newtyenv = Environment.extend id domty tyenv in
      let (s, ranty) = ty_exp newtyenv loop_id exp in
      (s, subst_type s (TyFun (domty, ranty)))
  | AppExp (exp1, exp2) ->
      let (s1, ty1) = ty_exp tyenv loop_id exp1 in
      let (s2, ty2) = ty_exp tyenv loop_id exp2 in
      let domty = TyVar (fresh_tyvar ()) in
      let ranty = TyVar (fresh_tyvar ()) in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) @ [(ty1, TyFun (domty, ranty)); (ty2, domty)] in
      let s3 = unify eqs in
      (s3, subst_type s3 ranty)
  | LetRecExp (id1, id2, exp1, exp2) ->
      let domty = TyVar (fresh_tyvar ()) in
      let ranty = TyVar (fresh_tyvar ()) in
      let newtyenv = Environment.extend id1 (TyFun (domty, ranty)) tyenv in
      let newertyenv = Environment.extend id2 domty newtyenv in
      let (s1, ty1) = ty_exp newertyenv loop_id exp1 in
      let (s2, ty2) = ty_exp newtyenv loop_id exp2 in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) @ [(ty1, ranty)] in
      let s3 = unify eqs in
      (s3, subst_type s3 ty2)
  | LoopExp (id, exp1, exp2) ->
      let (s1, ty1) = ty_exp tyenv loop_id exp1 in
      let newtyenv = Environment.extend id ty1 tyenv in
      let (s2, ty2) = ty_exp newtyenv id exp2 in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) in
      let s3 = unify eqs in
      (s3, subst_type s3 ty2)
  | RecurExp exp ->
      let (s, ty) = ty_exp tyenv loop_id exp in
      let ty' = Environment.lookup loop_id tyenv in
      let eqs = (eqs_of_subst s) @ [(ty, ty')] in
      let s' = unify eqs in
      (s', TyRecur)
  | TupleExp (exp1, exp2) ->
      let (s1, ty1) = ty_exp tyenv loop_id exp1 in
      let (s2, ty2) = ty_exp tyenv loop_id exp2 in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) in
      let s3 = unify eqs in
      (s3, subst_type s3 (TyTuple (ty1, ty2)))
  | ProjExp (exp, i) ->
      let (s, ty) = ty_exp tyenv loop_id exp in
     (match ty with
        TyTuple (ty1, ty2) ->
          if i = 1 then (s, subst_type s ty1)
          else if i = 2 then (s, subst_type s ty2)
          else err "Error: only permit <v>.1 or <v>.2"
      | _ -> err "Type Error: projection can apply to tuple")

let type_check exp = ty_exp Environment.empty ""; ()
