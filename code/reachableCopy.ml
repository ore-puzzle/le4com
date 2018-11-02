open Vm
open Cfg
open Dfa
module Set = MySet


let dummy = (-1, Local (-1))

let bottom = Set.empty

let cfg = ref [||]

let preds_exits = ref MyMap.empty


let rec string_of_preds_exits = function
    [] -> ""
  | (stmt, prop) :: rest -> string_of_instr " " "\t" stmt ^ "; " ^ string_of_preds_exits rest

let rec string_of_stmts = function
    [] -> ""
  | head :: rest -> string_of_instr " " "\t" head ^ "; " ^ string_of_stmts rest


let compare left right =
  if Set.is_empty (Set.diff left right) then
    (if Set.is_empty (Set.diff right left) then EQ else LT)
  else
    (if Set.is_empty (Set.diff right left) then GT else NO)

let intersection s1 s2 =
  Set.diff s1 (Set.diff (Set.union s1 s2) s2)

let rec multi_intersection = function
    [] -> Set.empty
  | [s] -> s
  | head :: rest -> intersection head (multi_intersection rest)

let lub old_entry_prop prop stmt =
  let rec make_pred_exit_prop = function
      [] -> []
    | head :: rest -> 
        let Some prop' = MyMap.get head !preds_exits in
        prop' :: make_pred_exit_prop rest in
  let (b_index, s_index) = find_stmt !cfg stmt in
  let pred = preds !cfg stmt in
  let not_recur_pred = 
    List.filter (fun pd ->
      let (b_index', s_index') = find_stmt !cfg pd in
      if b_index' < b_index then true
      else if b_index < b_index' then false
      else if s_index' < s_index then true
      else false) pred in
  let pred_exit_prop = make_pred_exit_prop not_recur_pred in
  Set.union (Set.singleton dummy) (multi_intersection pred_exit_prop)
    
  

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

let rec set_preds_exits cfg' =
  let stmts = Array.to_list (all_stmts cfg') in
  let rec body_loop = function
      [] -> MyMap.empty
    | head :: rest -> MyMap.assoc head (Set.singleton dummy) (body_loop rest)
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


let make cfg' = cfg := Array.concat (get_second_list cfg'); set_preds_exits !cfg;
{
  direction = FORWARD;
  transfer = transfer;
  compare = compare;
  lub = lub;
  bottom = bottom;
  init = Set.singleton dummy; (* 不動点反復を回すためのdirty hack *)
  to_str = string_of_eqs
}
