open Vm
open Cfg
open Dfa
module Set = MySet


let dummy = (-1, (-1, -1))

let bottom = Set.empty

let cfg = ref [||]


let compare left right =
  if Set.is_empty (Set.diff left right) then
    (if Set.is_empty (Set.diff right left) then EQ else LT)
  else
    (if Set.is_empty (Set.diff right left) then GT else NO)


let lub = Set.union 


let string_of_def (ofs, (b_index, s_index)) =
  "(" ^ (Vm.string_of_operand (Local ofs)) ^ ", " ^ (string_of_int b_index) ^ (string_of_int s_index) ^ ")"


let string_of_defs (vs: (id * (int * int)) Set.t) =
  String.concat ", "
    (List.sort String.compare
       (List.map string_of_def
          (List.filter (fun v -> v <> dummy) (Set.to_list vs))))

(* もらったcfgsからラベルをはがしてcfgのみを取り出す関数 *)
let rec get_second_list l =
  match l with
    [] -> []
  | (_, head) :: rest -> head :: get_second_list rest    

(* cfg中のstmtの位置を返す関数 *)
let location stmt = find_stmt !cfg stmt 

let transfer entry_defs stmt =
  let gen vs =
    Set.union
      (match stmt with
             Move (dst, _)
           | BinOp (dst, _, _, _)
           | Call (dst, _, _)
           | Malloc (dst, _)
           | Read (dst, _, _) -> Set.singleton (dst, location stmt)
           | _ -> Set.empty
         )
      vs in
  gen entry_defs (* killはいらない *)


let make cfg' = cfg := Array.concat (get_second_list cfg');
{
  direction = FORWARD;
  transfer = transfer;
  compare = compare;
  lub = lub;
  bottom = bottom;
  init = Set.singleton dummy; (* 不動点反復を回すためのdirty hack *)
  to_str = string_of_defs
}
