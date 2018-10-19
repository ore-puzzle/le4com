open Vm
open Cfg
open Dfa
module Set = MySet

(* ==== vars: 変数名の集合 ==== *)

let dummy = (-1, Local (-1))

let bottom = Set.empty

let compare left right =
  if Set.is_empty (Set.diff left right) then
    (if Set.is_empty (Set.diff right left) then EQ else LT)
  else
    (if Set.is_empty (Set.diff right left) then GT else NO)

let lub = Set.union

let string_of_eqs (ofs, op) =
  (Vm.string_of_operand (Local ofs)) ^ " = " ^ (Vm.string_of_operand op) 

let string_of_vars vs =
  String.concat ", "
    (List.sort String.compare
       (List.map string_of_eqs
          (List.filter (fun v -> v <> dummy) (Set.to_list vs))))

let filter_vars vs =
  Set.from_list (List.filter (fun (_, v) ->
      match v with
        Param _ | Local _ -> true
      | Proc _ | IntV _ -> false
    ) (Set.to_list vs))

let transfer entry_vars stmt =
  let gen vs =
    lub
      (filter_vars (match stmt with
             Move (dst, src) -> Set.singleton (dst, src)
           | _ -> Set.empty
         ))
      vs in
  let kill vs = vs in
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
