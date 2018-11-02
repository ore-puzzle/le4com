open Vm


type tri_bool = T | F | U



let get_subset op prop =
  match op with
    Local id ->
      List.filter (fun (dst, _) -> id = dst) prop 
  | _ -> []

let judge op op' =
  match op, op' with
    IntV i, _ ->
      if i > 0 then T else F
  | _, IntV i' ->
      if i' > 0 then T else F
  | _, _ -> U

let get_another_label l =
  let mark = String.rindex l '_' in
  let same_part = String.sub l 0 (mark + 1) in
  let number = int_of_string (String.sub l (mark + 1) ((String.length l) - (String.length same_part))) in
  same_part ^ string_of_int (number + 1)


let update cfg old_instr new_instr  =
  let (this_b_idx, this_s_idx) = Cfg.find cfg old_instr in
  cfg.(this_b_idx).stmt.(this_s_idx) <- new_instr              

let rec ops_to_ops' prop = function
    [] -> []
  | op :: rest ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, (b_idx, s_idx))] -> 
            let stmt = cfg.(b_idx).stmt.(s_idx) in
             (match stmt with
                Move (_, IntV i) -> IntV i
              | _ -> op)
        | _ -> op in
      op' :: ops_to_ops' prop rest

let fold defs instr =
  let prop = MySet.to_list (Dfa.get_property defs instr Cfg.BEFORE) in
  match instr with
    Move (id, op) ->
      let subset = get_subset op prop in
      match subset with
        [(_, (b_idx, s_idx))] ->
          let stmt = cfg.(b_idx).stmt.(s_idx) in
         (match stmt with
            Move (_, IntV i) ->
              update cfg instr (Move (id, IntV i));
              IntV i
          | _ -> instr)                        
      | _ -> instr in
      Move (id, op')
  | BinOp (id, binOp, op1, op2) ->
      let subset1 = get_subset op1 prop in
      let subset2 = get_subset op2 prop in
      let op1' =
        match subset1 with
          [(_, (b_idx1, s_idx1))] ->
            let stmt1 = cfg.(b_idx1).stmt.(s_idx1) in
           (match stmt with
              Move (_, IntV i) -> IntV i
            | _ -> op1)
        | _ -> op1 in
      let op2' =
        match subset2 with
          [(_, (b_idx2, s_idx2))] ->
            let stmt2 = cfg.(b_idx2).stmt.(s_idx2) in
           (match stmt with
              Move (_, IntV i) -> IntV i
            | _ -> op2)
        | _ -> op2 in
     (match op1', op2' with
        IntV i1, IntV i2 -> 
          let computed_value =
            match binOp with
              Plus ->  i1 + i2
            | Mult -> i1 * i2
            | Lt -> if i1 < i2 then 1 else 0 in
          update cfg instr (Move (id, IntV computed_value));
          Move (id, IntV computed_value)
      | _ -> update cfg instr (BinOp (id, binOp, op1', op2'));
             BinOp (id, binOp, op1', op2')
  | Label l -> Label l
  | BranchIf (op, l) ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, (b_idx, s_idx))] ->
            let stmt = cfg.(b_idx).stmt.(s_idx) in
           (match stmt with
              Move (_, IntV i) -> IntV i
            | _ -> op)                        
        | _ -> op in
      let anoter_l = get_another_label l in
     (match judge op op' with
        T ->
      | F ->
      | U -> BranchIf (op, l))
  | Goto l -> Goto l
  | Call (id, op_f, ops) ->
      let ops' = ops_to_ops' prop ops in
      Call (id, op_f, ops')
  | Return op ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, (b_idx, s_idx))] ->
            let stmt = cfg.(b_idx).stmt.(s_idx) in
           (match stmt with
              Move (_, IntV i) -> IntV i
            | _ -> op)                        
        | _ -> op in
      Return op'
  | Malloc (id, ops) ->
      let ops' = ops_to_ops' prop ops in
      update cfg instr (Malloc (id, ops'));
      Malloc (id, ops')
  | Read (id, op, i) ->
      let subset = get_subset op prop in
      match subset with
        [(_, (b_idx, s_idx))] ->
          let stmt = cfg.(b_idx).stmt.(s_idx) in
         (match stmt with
            Malloc (_, ops) ->
             (match List.nth ops i with
                IntV i -> 
                  update cfg instr (Move (id, IntV i));
                  Move (id, IntV i)
                | instr)                
          | _ -> instr)                        
      | _ -> instr



let fold_const defs cfgs = 
  let cfg = List.map (fun (_, cfg') -> cfg') in
  List.map (fun (ProcDecl (l, i, instr)) -> ProcDecl (l, i, List.map (fold defs cfg) instr))
