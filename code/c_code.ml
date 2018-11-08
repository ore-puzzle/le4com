module S = Syntax

exception Error of string
let err s = raise (Error s)



(* 0-25をa-zに変換する *)
let alphabet_of_0to25 i = 
  if i >= 0 && i <= 25 then Char.escaped (char_of_int (i + 97))
  else "error" (* この文は実行されないはず(呼び出し側が気をつける) *)

(* idを'a,...,'z,'a1,...のstringにする *)
let var_name_of_id id =
  let mod26 = id mod 26 in
  let quo26 = id / 26 in
  let alphabet = alphabet_of_0to25 mod26 in
  let suffix = if quo26 = 0 then "" else string_of_int quo26 in
  "'" ^ alphabet ^ suffix


let gen_decl (Vm.ProcDecl (name, nlocal, instrs)) =
  let gen_instr = function
      Vm.Move (id, op) -> 
    | Vm.BinOp (id, binOp, op1, op2) ->      
    | Vm.Label label -> [Label label]
    | Vm.BranchIf (op, label) ->
    | Vm.Goto label -> [Instr (B label)]
    | Vm.Call (id, op_f, [op1; op2]) ->    
    | Vm.Return op ->
    | Vm.Malloc (id, ops) ->
    | Vm.Read (id, op, i) ->
  in
    let instr_list = List.concat (List.map gen_instr instrs) in
    

let codegen vmprog =
