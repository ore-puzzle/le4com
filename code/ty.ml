open Syntax

type tyvar = int

type ty =
    TyInt
  | TyBool
  | TyVar of tyver
  | TyFun of ty * ty
  | TyTuple of ty * ty

type subst = (tyvar * ty) list

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
      | TyVar alpha, _ ->
          if MySet.member alpha (freevar_ty ty2) then err ("Type error: cannot unify")
          else (alpha, ty2) :: unify (subst_eqs [(alpha, ty2)] rest)
      | _, TyVar alpha ->
          if MySet.member alpha (freevar_ty ty1) then err ("Type error: cannot unify")
          else (alpha, ty1) :: unify (subst_eqs [(alpha, ty1)] rest)
      | _ -> err ("Type error: cannot unify"))


let rec ty_exp tyenv = function
    Var x ->
     (try
        let ty = Environment.lookup x tyenv in
        ([], ty)
      with Environment.Not_bound -> err ("Error: variable not bound: " ^ x))
  | ILit i -> ([], TyInt)
  | BLit b -> ([], TyBool)
  | BinOp (binOp, exp1, exp2) ->
  | IfExp (exp1, exp2, exp3) ->
      let (s1, ty1) = ty_exp tyenv exp1 in
      let (s2, ty2) = ty_exp tyenv exp2 in
      let (s3, ty3) = ty_exp tyenv exp3 in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) @ (eqs_of_subst s3) @ [(ty1, TyBool); (ty2, ty3)] in
      let s4 = unify eqs in
      (s4, subst_type s4 ty2)
  | LetExp (id, exp1, exp2) ->
      let (s1, ty1) = ty_exp tyenv exp1 in
      let newtyenv = Environment.extend id ty1 tyenv in
      let (s2, ty2) = ty_exp newtyenv exp2 in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) in
      let s3 = unify eqs in
      (s3, subst_type s3 ty2)
  | FunExp (id, exp) ->
      let domty = TyVar (fresh_tyvar ()) in
      let newtyenv = Environment.extend id domty tyenv in
      let (s, ranty) = ty_exp newtyenv exp in
      (s, subst_type s (TyFun (domty, ranty)))
  | AppExp (exp1, exp2) ->
      let (s1, ty1) = ty_exp tyenv exp1 in
      let (s2, ty2) = ty_exp tyenv exp2 in
      let domty = TyVar (fresh_tyvar ()) in
      let ranty = TyVar (fresh_tyvar ()) in
      let eqs = (eqs_of_subst s1) @ (eqs_of_subst s2) @ [(ty1, TyFun (domty, ranty)); (ty2, domty)] in
      let s3 = unify eqs in
      (s3, subst_type s3 ranty)
  | LetRecExp (id1, id2, exp1, exp2) ->
  | LoopExp (id, exp1, exp2) ->
  | RecurExp exp ->
  | TupleExp (exp1, exp2) ->
      let ty1 = ty_exp tyenv exp1 in
      let ty2 = ty_exp tyenv exp2 in
      TyTuple (ty1, ty2)
  | ProjExp (exp, i) ->
      let ty = ty_exp tyenv exp in
     (match ty with
        TyTuple (ty1, ty2) ->
          if i = 1 then ty1
          else if i = 2 then ty2
          else err "Error: only permit <v>.1 or <v>.2"
      | _ -> err "Type Error: projection can apply to tuple")
