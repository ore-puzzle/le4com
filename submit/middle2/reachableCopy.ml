open Vm
open Cfg
open Dfa
module Set = MySet


let dummy = (-1, Local (-1))

let bottom = Set.empty

let cfg = ref [||]

let preds_exits = ref MyMap.empty

let compare left right =
  if Set.is_empty (Set.diff left right) then
    (if Set.is_empty (Set.diff right left) then EQ else LT)
  else
    (if Set.is_empty (Set.diff right left) then GT else NO)

let lub = Set.union

let string_of_eq (ofs, op) =
  (Vm.string_of_operand (Local ofs)) ^ " = " ^ (Vm.string_of_operand op) 

let string_of_eqs vs =
  String.concat ", "
    (List.sort String.compare
       (List.map string_of_eq
          (List.filter (fun v -> v <> dummy) (Set.to_list vs))))

let rec get_second_list l =
  match l with
    [] -> []
  | (_, head) :: rest -> head :: get_second_list rest

let rec set_preds_exits =
  let stmts = Array.to_list (all_stmts !cfg) in
  let rec body_loop = function
      [] -> MyMap.empty
    | head :: rest -> MyMap.assoc head (Set.empty : (id * operand) Set.t) (body_loop rest)
  in
    preds_exits := (body_loop stmts)
  
    

let filter_eqs vs =
  Set.from_list (List.filter (fun (_, v) ->
      match v with
        Param _ | Local _ -> true
      | Proc _ | IntV _ -> false
    ) (Set.to_list vs))




let transfer entry_eqs stmt =
  let gen vs =
    Set.union
      (filter_eqs (match stmt with
             Move (dst, src) -> Set.singleton (dst, src)
           | _ -> Set.empty
         ))
      vs in
  let result = gen entry_eqs in
  preds_exits := (MyMap.assoc stmt result !preds_exits);
  result


let make cfg' = cfg := Array.concat (get_second_list cfg');
{
  direction = FORWARD;
  transfer = transfer;
  compare = compare;
  lub = lub;
  bottom = bottom;
  init = Set.singleton dummy; (* 不動点反復を回すためのdirty hack *)
  to_str = string_of_eqs
}
