open Vm
open Cfg

(* 3値論理 *)
type tri_bool = T | F | U

(* ifの条件式がtrueかfalseか、あるいはわからないかを判定 *)
let judge op =
  match op with
    IntV i-> if i > 0 then T else F
  | _ -> U

(* プロパティのからopに関する部分のみを取り出す *)
let get_subset op prop =
  match op with
    Local id ->
      List.filter (fun (dst, _) -> id = dst) prop 
  | _ -> []

(* BranchIfで合流地点においてあるラベルを得るための関数 *)
(* そのラベルの作られ方に依存 *)
let get_another_label l =
  let mark = String.rindex l '_' in
  let same_part = String.sub l 0 (mark + 1) in
  let number = int_of_string (String.sub l (mark + 1) ((String.length l) - (String.length same_part))) in
  same_part ^ string_of_int (number + 1)

(* cfgを書き換える *)
let update cfg old_instr new_instr  =
  let (this_b_idx, this_s_idx) = find_stmt cfg old_instr in
  cfg.(this_b_idx).stmts.(this_s_idx) <- new_instr              

(* opのリストの定数畳み込み *)
let rec ops_to_ops' cfg prop = function
    [] -> []
  | op :: rest ->
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, (b_idx, s_idx))] -> 
            let stmt = cfg.(b_idx).stmts.(s_idx) in
             (match stmt with
                Move (_, IntV i) -> IntV i
              | _ -> op)
        | _ -> op in
      op' :: ops_to_ops' cfg prop rest

(* 定数畳み込みを行う関数 *)
(* 各オペランドがLocalで、そこに到達している定義が一つで、
   かつそれがIntVをMoveしているならIntVをMoveするものに置き換える
   そのときにプロパティも書き換える *)
let fold defs cfg instr =
  match instr with
    Move (id, op) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset = get_subset op prop in
     (match subset with
        [(_, (b_idx, s_idx))] ->
          let stmt = cfg.(b_idx).stmts.(s_idx) in
         (match stmt with
            Move (_, IntV i) ->
              update cfg instr (Move (id, IntV i));
              Move (id, IntV i)
          | _ -> instr)                        
      | _ -> instr)
    (* BinOpは (p1 + 1) + 2 => p1 + 3
               (p1 * 2) * 3 => p1 * 6
       のように二つのBinOpが一つのBinOpに置き換えられる場合も置き換える
       詳しく言うと、一つの変数、二つの即値が同じ演算で並んでいるような場合に置き換える *)
    (* 一気に畳み込むこともできなくはないが、さらにコードが肥大化するため、畳み込みはone stepずつ進める *)
  | BinOp (id, binOp, op1, op2) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset1 = get_subset op1 prop in
      let subset2 = get_subset op2 prop in
      let result =
        match subset1, subset2 with
          [(_, (b_idx1, s_idx1))], [(_, (b_idx2, s_idx2))] ->
            let stmt1 = cfg.(b_idx1).stmts.(s_idx1) in
            let stmt2 = cfg.(b_idx2).stmts.(s_idx2) in
           (match stmt1, stmt2 with
              Move (_, IntV i1), Move (_, IntV i2) ->
                BinOp (id, binOp, IntV i1, IntV i2)
            | Move (_, IntV i1), BinOp (_, binOp2, op21, op22) ->
               (match op21, op22 with
                  IntV i, _ ->
                   (match binOp, binOp2 with
                      Plus, Plus -> BinOp (id, Plus, IntV (i1 + i), op22)
                    | Mult, Mult -> BinOp (id, Mult, IntV (i1 * i), op22)
                    | _, _ -> BinOp (id, binOp, IntV i1, op2))
                | _, IntV i ->
                   (match binOp, binOp2 with
                      Plus, Plus -> BinOp (id, Plus, op21, IntV (i1 + i))
                    | Mult, Mult -> BinOp (id, Mult, op21, IntV (i1 * i))
                    | _, _ -> BinOp (id, binOp, IntV i1, op2))
                | _, _ -> BinOp (id, binOp, op1, op2))
            | BinOp (_, binOp1, op11, op12), Move (_, IntV i2) ->
               (match op11, op12 with
                  IntV i, _ ->
                   (match binOp, binOp1 with
                      Plus, Plus -> BinOp (id, Plus, IntV (i2 + i), op12)
                    | Mult, Mult -> BinOp (id, Mult, IntV (i2 * i), op12)
                    | _, _ -> BinOp (id, binOp, op1, IntV i2))
                | _, IntV i ->
                   (match binOp, binOp1 with
                      Plus, Plus -> BinOp (id, Plus, op11, IntV (i2 + i))
                    | Mult, Mult -> BinOp (id, Mult, op11, IntV (i2 * i))
                    | _, _ -> BinOp (id, binOp, op1, IntV i2))
                | _, _ -> BinOp (id, binOp, op1, op2))
            | Move (_, IntV i1), _ -> BinOp (id, binOp, IntV i1, op2)
            | _, Move (_, IntV i2) -> BinOp (id, binOp, op1, IntV i2)
            | _, _ -> BinOp (id, binOp, op1, op2))
        | [(_, (b_idx1, s_idx1))], [] -> 
            let stmt1 = cfg.(b_idx1).stmts.(s_idx1) in
           (match stmt1, op2 with
              BinOp (_, binOp1, op11, op12), IntV i2 ->
               (match op11, op12 with
                  IntV i, _ ->
                   (match binOp, binOp1 with
                      Plus, Plus -> BinOp (id, Plus, IntV (i2 + i), op12)
                    | Mult, Mult -> BinOp (id, Mult, IntV (i2 * i), op12)
                    | _, _ -> BinOp (id, binOp, op1, IntV i2))
                | _, IntV i ->
                   (match binOp, binOp1 with
                      Plus, Plus -> BinOp (id, Plus, op11, IntV (i2 + i))
                    | Mult, Mult -> BinOp (id, Mult, op11, IntV (i2 * i))
                    | _, _ -> BinOp (id, binOp, op1, IntV i2))
                | _, _ -> BinOp (id, binOp, op1, op2)) 
            | Move (_, IntV i), _ -> BinOp (id, binOp, IntV i, op2)
            | _, _ -> BinOp (id, binOp, op1, op2))
        | [], [(_, (b_idx2, s_idx2))] -> 
            let stmt2 = cfg.(b_idx2).stmts.(s_idx2) in
           (match op1, stmt2 with
              IntV i1, BinOp (_, binOp2, op21, op22) ->
               (match op21, op22 with
                  IntV i, _ ->
                   (match binOp, binOp2 with
                      Plus, Plus -> BinOp (id, Plus, IntV (i1 + i), op22)
                    | Mult, Mult -> BinOp (id, Mult, IntV (i1 * i), op22)
                    | _, _ -> BinOp (id, binOp, IntV i1, op2))
                | _, IntV i ->
                   (match binOp, binOp2 with
                      Plus, Plus -> BinOp (id, Plus, op21, IntV (i1 + i))
                    | Mult, Mult -> BinOp (id, Mult, op21, IntV (i1 * i))
                    | _, _ -> BinOp (id, binOp, IntV i1, op2))
                | _, _ -> BinOp (id, binOp, op1, op2))
            | _, Move (_, IntV i) -> BinOp (id, binOp, op1, IntV i)
            | _, _ -> BinOp (id, binOp, op1, op2))
        | _, _ -> 
           (match op1, op2 with
              IntV i1, IntV i2 ->
                let computed_value =
                    match binOp with
                      Plus ->  i1 + i2
                    | Mult -> i1 * i2
                    | Lt -> if i1 < i2 then 1 else 0 in
                  Move (id, IntV computed_value)
            | _, _ -> BinOp (id, binOp, op1, op2)) in
      update cfg instr result;
      result  
  | Label l -> Label l
  | BranchIf (op, l) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, (b_idx, s_idx))] ->
            let stmt = cfg.(b_idx).stmts.(s_idx) in
           (match stmt with
              Move (_, IntV i) -> IntV i
            | _ -> op)                        
        | _ -> op in
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
              Move (_, Proc l) -> Proc l (* op_fについてはIntVではなくProc　*)
            | _ -> op_f) 
        | _ -> op_f in
      let ops' = ops_to_ops' cfg prop ops in
      Call (id, op_f', ops')
  | Return op ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset = get_subset op prop in
      let op' = 
        match subset with
          [(_, (b_idx, s_idx))] ->
            let stmt = cfg.(b_idx).stmts.(s_idx) in
           (match stmt with
              Move (_, IntV i) -> IntV i
            | _ -> op)                        
        | _ -> op in
      Return op'
  | Malloc (id, ops) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let ops' = ops_to_ops' cfg prop ops in
      update cfg instr (Malloc (id, ops'));
      Malloc (id, ops')
    (* ReadはMallocの中身まで見に行く *)
    (* また、IntVだけでなくProcも確認する *)
  | Read (id, op, i) ->
      let prop = MySet.to_list (Dfa.get_property defs instr BEFORE) in
      let subset = get_subset op prop in
      match subset with
        [(_, (b_idx, s_idx))] ->
          let stmt = cfg.(b_idx).stmts.(s_idx) in
         (match stmt with
            Malloc (_, ops) ->
             (match List.nth ops i with
                Proc l ->
                  update cfg instr (Move (id, Proc l));
                  Move (id, Proc l)
              | IntV i -> 
                  update cfg instr (Move (id, IntV i));
                  Move (id, IntV i)
              | _ -> instr)                
          | _ -> instr)                        
      | _ -> instr

(* then部を削除する関数 *)
let eliminate_then l1 l2 instr =
  let rec through = function
      [] -> [] 
    | Label l :: rest when l = l1 -> eliminate rest
    | head :: rest -> head :: through rest
  and eliminate = function
      [] -> [] 
    | Label l :: rest when l = l2 -> rest
    | _ :: rest -> eliminate rest
  in
    through instr

(* else部を削除する関数 *)
let eliminate_else l1 l2 instr =
  let rec eliminate = function
      [] -> [] 
    | Label l :: rest when l = l1 -> through rest
    | _ :: rest -> eliminate rest
  and through = function
      [] -> [] 
    | Label l :: rest when l = l2 -> rest
    | head :: rest -> head :: through rest
  in
    eliminate instr

(* bifを（削除できるなら）削除する関数 *)
let rec eliminate_branchIf  = function
    [] -> []
  | BranchIf (op, l) as head :: rest ->
      let l' = get_another_label l in (* 合流地点に置いてあるラベル *)
     (match judge op with
        T -> eliminate_branchIf (eliminate_else l l' rest)
      | F -> eliminate_branchIf (eliminate_then l l' rest)
      | U -> head :: eliminate_branchIf rest)
  | head :: rest -> head :: eliminate_branchIf rest


let fold_const defs cfgs = 
  let cfgs' = List.fold_left (Array.append) [||] (List.map (fun (_, cfg) -> cfg) cfgs) in
  List.map (fun (ProcDecl (l, i, instr)) -> ProcDecl (l, i, eliminate_branchIf (List.map (fold defs cfgs') instr)))

