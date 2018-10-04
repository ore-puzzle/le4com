exception Error of string
let err s = raise (Error s)

type id = string

type binOp = Plus | Mult | Lt

type exp =
    Var       of id
  | ILit      of int
  | BLit      of bool
  | BinOp     of binOp * exp * exp
  | IfExp     of exp * exp * exp
  | LetExp    of id * exp * exp
  | FunExp    of id * exp
  | AppExp    of exp * exp
  | LetRecExp of id * id * exp * exp
  | LoopExp   of id * exp * exp (* loop <id> = <exp> in <exp> *)
  | RecurExp  of exp            (* recur <exp> *)
  | TupleExp  of exp * exp      (* (<exp>, <exp>) *)
  | ProjExp   of exp * int      (* <exp> . <int> *)

(* ==== recur式が末尾位置にのみ書かれていることを検査 ==== *)

let recur_check e = 
  let rec body_loop e is_end =
    match e with
      Var _
    | ILit _ 
    | BLit _ -> ()
    | BinOp (_, e1, e2)
    | AppExp (e1, e2)
    | TupleExp (e1, e2) ->
        body_loop e1 false; body_loop e2 false      
    | IfExp (e1, e2, e3) ->
        body_loop e1 false;
        if is_end then
          (body_loop e2 true; body_loop e3 true)
        else
          body_loop e2 false; body_loop e3 false
    | LetExp (_, e1, e2)     
    | LetRecExp (_, _, e1, e2) ->
        body_loop e1 false;
        if is_end then
          body_loop e2 true
        else
          body_loop e2 false
    | FunExp (_, e')
    | ProjExp (e', _) ->
        body_loop e' false
    | LoopExp (_, e1, e2) ->
        body_loop e1 false; body_loop e2 true
    | RecurExp e' ->
        if is_end then
          body_loop e' true
        else err "recur must be the end"
  in
    body_loop e true

        
