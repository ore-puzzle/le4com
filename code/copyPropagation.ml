open Vm

let get_subset op prop =
  match op with
    Local id ->
      List.filter (fun (dst, _) -> id = dst) prop 
  | _ -> []

let rec ops_to_ops' prop = function
    [] -> []
  | op :: rest ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, copied_op)] -> copied_op
        | _ -> op in
      op' :: ops_to_ops' prop rest

let propagate_copy copies instr =
  let prop = MySet.to_list (Dfa.get_property copies instr Cfg.BEFORE) in
  match instr with
    Move (id, op) ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, copied_op)] ->  copied_op
        | _ -> op in
      Move (id, op')
  | BinOp (id, binOp, op1, op2) ->
      let subset1 = get_subset op1 prop in
      let subset2 = get_subset op2 prop in
      let (op1', op2') =
        match subset1, subset2 with
          [(_, copied_op1)], [(_, copied_op2)] -> (copied_op1, copied_op2)
        | [(_, copied_op1)], _ -> (copied_op1, op2)
        | _, [(_, copied_op2)] -> (op1, copied_op2)
        | _, _ -> (op1, op2) in
      BinOp (id, binOp, op1', op2')
  | Label l -> Label l
  | BranchIf (op, l) ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, copied_op)] -> copied_op
        | _ -> op in
      BranchIf (op', l)
  | Goto l -> Goto l
  | Call (id, op_f, ops) ->
      let subset = get_subset op_f prop in
      let op_f' = 
        match subset with
          [(_, copied_op_f)] -> copied_op_f
        | _ -> op_f in
      let ops' = ops_to_ops' prop ops in
      Call (id, op_f', ops')
  | Return op ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, copied_op)] -> copied_op
        | _ -> op in
      Return op'
  | Malloc (id, ops) ->
      let ops' = ops_to_ops' prop ops in
      Malloc (id, ops')
  | Read (id, op, i) ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, copied_op)] -> copied_op
        | _ -> op in
      Read (id, op', i)



let propagate_copies copies = List.map (fun (ProcDecl (l, i, instr)) -> ProcDecl (l, i, List.map (propagate_copy copies) instr))
