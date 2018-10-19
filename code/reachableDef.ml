open Vm
open Cfg
open Dfa
module Set = MySet

(* ==== vars: 変数名の集合 ==== *)

let dummy = (-1, "-1")

let bottom = Set.empty

let cfg = ref [||]

let compare left right =
  if Set.is_empty (Set.diff left right) then
    (if Set.is_empty (Set.diff right left) then EQ else LT)
  else
    (if Set.is_empty (Set.diff right left) then GT else NO)

let lub = Set.union

let string_of_defs (ofs, num) =
  "(" ^ (Vm.string_of_operand (Local ofs)) ^ ", " ^ num ^ ")"

let string_of_vars vs =
  String.concat ", "
    (List.sort String.compare
       (List.map string_of_defs
          (List.filter (fun v -> v <> dummy) (Set.to_list vs))))

let rec get_second_list l =
  match l with
    [] -> []
  | (_, head) :: rest -> head :: get_second_list rest

let set_cfg cfg' = cfg := Array.concat (get_second_list cfg')
    

let rec remove dst = function
    [] -> []
  | (dst', _) as head :: rest ->
      if dst = dst' then rest
      else head :: (remove dst rest)

let line_number stmt =
  let (b_index, s_index) = Cfg.find_stmt !cfg stmt in
  (string_of_int b_index) ^ (string_of_int s_index)

let transfer entry_vars stmt =
  let gen vs =
    lub
      (match stmt with
             Move (dst, _)
           | BinOp (dst, _, _, _)
           | Call (dst, _, _)
           | Malloc (dst, _)
           | Read (dst, _, _) -> Set.singleton (dst, line_number stmt)
           | _ -> Set.empty
         )
      vs in
  let kill vs =
    match stmt with
      Move (dst, _)
    | BinOp (dst, _, _, _)
    | Call (dst, _, _)
    | Malloc (dst, _)
    | Read (dst, _, _) -> Set.from_list (remove dst (Set.to_list vs))
    | _ -> vs in
  gen (kill entry_vars)

let make () = {
  direction = FORWARD;
  transfer = transfer;
  compare = compare;
  lub = lub;
  bottom = bottom;
  init = Set.singleton dummy; (* 不動点反復を回すためのdirty hack *)
  to_str = string_of_vars
}
