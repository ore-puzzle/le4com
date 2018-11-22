open Vm



let rec eliminate_dead_code lives instr =
  match instr with
    [] -> []
  | (Move (id, _) as head) :: rest
  | (BinOp (id, _, _, _) as head) :: rest
  | (Call (id, _, _) as head) :: rest
  | (Malloc (id, _) as head) :: rest
  | (Read (id, _, _) as head) :: rest ->
      let prop = Dfa.get_property lives head Cfg.AFTER in
      if MySet.member (Local id) prop then head :: eliminate_dead_code lives rest
      else eliminate_dead_code lives rest (* この命令の直後に生存していないなら削除 *)
  | _ as head :: rest -> head :: eliminate_dead_code lives rest

let eliminate_dead_codes lives = List.map (fun (ProcDecl (l, i, instr)) -> ProcDecl (l, i, eliminate_dead_code lives instr))
