open Vm
open Cfg

(* constantFoldingのIntVの部分がLocalまたはParamになったのとほぼ同じ *)

let get_subset op prop =
  match op with
    Local id ->
      List.filter (fun (dst, _) -> id = dst) prop 
  | _ -> []


let update cfg old_instr new_instr  =
  let (this_b_idx, this_s_idx) = find_stmt cfg old_instr in
  cfg.(this_b_idx).stmts.(this_s_idx) <- new_instr              

let rec ops_to_ops' cfg prop = function
    [] -> []
  | op :: rest ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, (b_idx, s_idx))] -> 
            let stmt = cfg.(b_idx).stmts.(s_idx) in
             (match stmt with
                Move (_, Local ofs) -> Local ofs
              | Move (_, Param i) -> Param i
              | _ -> op)
        | _ -> op in
      op' :: ops_to_ops' cfg prop rest

let propagate_copy defs cfg instr =
  match instr with
    Move (id, op) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset = get_subset op prop in
      let op' =
        match subset with
          [(_, (b_idx, s_idx))] ->
            let stmt = cfg.(b_idx).stmts.(s_idx) in
           (match stmt with
              Move (_, Local ofs) -> Local ofs
            | Move (_, Param i) -> Param i
            | _ -> op)                        
        | _ -> op in
      update cfg instr (Move (id, op'));
      Move (id, op')
  | BinOp (id, binOp, op1, op2) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset1 = get_subset op1 prop in
      let subset2 = get_subset op2 prop in
      let op1' =
        match subset1 with
          [(_, (b_idx1, s_idx1))] ->
            let stmt1 = cfg.(b_idx1).stmts.(s_idx1) in
           (match stmt1 with
              Move (_, Local ofs) -> Local ofs
            | Move (_, Param i) -> Param i
            | _ -> op1)
        | _ -> op1 in
      let op2' =
        match subset2 with
          [(_, (b_idx2, s_idx2))] ->
            let stmt2 = cfg.(b_idx2).stmts.(s_idx2) in
           (match stmt2 with
              Move (_, Local ofs) -> Local ofs
            | Move (_, Param i) -> Param i
            | _ -> op2)
        | _ -> op2 in
      update cfg instr (BinOp (id, binOp, op1', op2'));
      BinOp (id, binOp, op1', op2')
  | Label l -> Label l
  | BranchIf (op, l) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, (b_idx, s_idx))] ->
            let stmt = cfg.(b_idx).stmts.(s_idx) in
           (match stmt with
              Move (_, Local ofs) -> Local ofs
            | Move (_, Param i) -> Param i
            | _ -> op)                        
        | _ -> op in
      update cfg instr (BranchIf (op', l));
      BranchIf (op', l)
  | Goto l -> Goto l
  | Call (id, op_f, ops) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset = get_subset op_f prop in
      let op_f' =
        match subset with
          [(_, (b_idx, s_idx))] ->
            let stmt = cfg.(b_idx).stmts.(s_idx) in
           (match stmt with
              Move (_, Local ofs) -> Local ofs
            | Move (_, Param i) -> Param i
            | _ -> op_f) 
        | _ -> op_f in
      let ops' = ops_to_ops' cfg prop ops in
      update cfg instr (Call (id, op_f', ops'));
      Call (id, op_f', ops')
  | Return op ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, (b_idx, s_idx))] ->
            let stmt = cfg.(b_idx).stmts.(s_idx) in
           (match stmt with
              Move (_, Local ofs) -> Local ofs
            | Move (_, Param i) -> Param i
            | _ -> op)                        
        | _ -> op in
      update cfg instr (Return op');
      Return op'
  | Malloc (id, ops) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let ops' = ops_to_ops' cfg prop ops in
      update cfg instr (Malloc (id, ops'));
      Malloc (id, ops')
  | Read (id, op, i) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset = get_subset op prop in
      let op' =
        match subset with
          [(_, (b_idx, s_idx))] ->
            let stmt = cfg.(b_idx).stmts.(s_idx) in
           (match stmt with
              Move (_, Local ofs) -> Local ofs      
            | Move (_, Param i') -> Param i'
            | _ -> op)
        | _ -> op in
      update cfg instr (Read (id, op', i));              
      Read (id, op', i)


let propagate_copies defs cfgs = 
  let cfgs' = List.fold_left (Array.append) [||] (List.map (fun (_, cfg) -> cfg) cfgs) in
  List.map (fun (ProcDecl (l, i, instr)) -> ProcDecl (l, i, List.map (propagate_copy defs cfgs') instr))
