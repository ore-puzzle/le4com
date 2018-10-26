exception Error of string
let err s = raise (Error s)

type binOp = Vm.binOp

type offset = int
type label = string

type reg = int       (* 汎用レジスタ．0以上の整数 *)

(* コード生成が swap に利用するための専用レジスタ．
   実際にどの物理レジスタを用いるかはアーキテクチャ依存 *)
let reserved_reg = -1

type dest =
    R of reg     (* レジスタ *)
  | L of offset  (* 局所領域の関数フレーム中の相対位置  *)

type operand =
    Param of int
  | Reg   of reg
  | Proc  of label
  | IntV  of int

type instr =
    Move     of reg * operand
  | Load     of reg * offset
  | Store    of reg * offset
  | BinOp    of reg * Vm.binOp * operand * operand
  | Label    of label
  | BranchIf of operand * label
  | Goto     of label
  | Call     of dest * operand * operand list
  | Return   of operand
  | Malloc   of dest * int  (* int: 確保するワード数 *)
  | Assign   of dest * int * operand  (* (dest).(int) <- (operand) *)
  | Read     of dest * operand * int

type decl =
    ProcDecl of label * int * instr list (* int: 局所領域の個数 *)

type prog = decl list


(* Formatter *)

let string_of_binop = function
    Syntax.Plus -> "add"
  | Syntax.Mult -> "mul"
  | Syntax.Lt   -> "lt"

let string_of_dest = function
    R r -> "r" ^ string_of_int r
  | L oft -> "t" ^ string_of_int oft

let string_of_operand = function
    Param i -> "p" ^ string_of_int i
  | Reg r -> "r" ^ string_of_int r
  | Proc  l -> l
  | IntV  i -> string_of_int i

let string_of_instr idt tab = function
    Move (t, v) ->
      idt ^ "move" ^ tab ^ "r" ^ string_of_int t ^ ", " ^
      string_of_operand v
  | Load (r, oft) ->
      idt ^ "load" ^ tab ^ "r" ^ string_of_int r ^ ", t" ^
      string_of_int oft
  | Store (r, oft) ->
      idt ^ "store" ^ tab ^ "r" ^ string_of_int r ^ ", t" ^
      string_of_int oft
  | BinOp (t, op, v1, v2) ->
      idt ^ string_of_binop op ^ tab ^ "r" ^ string_of_int t ^ ", " ^
      string_of_operand v1 ^ ", " ^ string_of_operand v2
  | Label lbl -> lbl ^ ":"
  | BranchIf (v, lbl) ->
      idt ^ "bif" ^ tab ^ string_of_operand v ^ ", " ^ lbl
  | Goto lbl ->
      idt ^ "goto" ^ tab ^ lbl
  | Call (dst, tgt, [a0; a1]) ->
      idt ^ "call" ^ tab ^ string_of_dest dst ^ ", " ^
      string_of_operand tgt ^
      "(" ^ string_of_operand a0 ^ ", " ^ string_of_operand a1 ^ ")"
  | Call (_, _, args) -> err ("Illegal number of arguments: " ^
                              string_of_int (List.length args))
  | Return v ->
      idt ^ "ret" ^ tab ^ string_of_operand v
  | Malloc (t, i) ->
      idt ^ "new" ^ tab ^ string_of_dest t ^ " [" ^
      string_of_int i ^ "]"
  | Assign (t, i, v) ->
      idt ^ "asn" ^ tab ^ "#" ^ string_of_int i ^ "(" ^ string_of_dest t ^
      ") " ^ string_of_operand v
  | Read (t, v, i) ->
      idt ^ "read" ^ tab ^ string_of_dest t ^ " #" ^
      string_of_int i ^ "(" ^ string_of_operand v ^ ")"

let string_of_decl (ProcDecl (lbl, n, instrs)) =
  "proc " ^ lbl ^ "(" ^ string_of_int n ^ ") =\n" ^
  (String.concat "\n"
     (List.map (fun i -> string_of_instr "  " "\t" i) instrs)) ^ "\n"

let string_of_reg prog =
  String.concat "\n" (List.map string_of_decl prog)

(* ==== constant ==== *)
let dummy = -1 

let tmp = 2
let rare_tmp = 3

(* ==== for debug ==== *)

let string_of_id id = string_of_int id

let rec string_of_ofs = function
    [] -> ""
  | head :: rest -> (string_of_id head) ^ ";" ^ (string_of_ofs rest)

let rec string_of_ofses = function
    [] -> ""
  | head :: rest -> (string_of_ofs head) ^ " ; " ^ (string_of_ofses rest)

(* ==== support function ==== *)

let rec get_properties_as_list lives = function
    [] -> []
  | stmt :: rest -> (MySet.to_list (Dfa.get_property lives stmt Cfg.BEFORE)) ::
                    (MySet.to_list (Dfa.get_property lives stmt Cfg.AFTER)) ::
                    get_properties_as_list lives rest

let trans_props_from_op_to_ofs props =
  let rec outer_loop props =
    match props with
      [] -> []
    | head :: rest -> (inner_loop head) :: outer_loop rest
  and inner_loop prop =
    match prop with
      [] -> []
    | head :: rest ->
       (match head with
          Vm.Local ofs when ofs <> -1-> ofs :: inner_loop rest
        | _ -> inner_loop rest)
  in
    outer_loop props



let make_adjacency_matrix ofses size =
  let matrix = Array.make_matrix size size 0 in
  let rec outer_loop = function
      [] -> ()
    | head :: rest -> inner_loop head; outer_loop rest
  and inner_loop = function
      [] -> ()
    | head :: rest -> 
        for i = 0 to (List.length rest) - 1 do
          matrix.(head).(List.nth rest i) <- 1;
          matrix.(List.nth rest i).(head) <- 1
        done;
        inner_loop rest
  in
    outer_loop ofses;
    matrix


let rec make_node_color_list node_num =
  match node_num with
    0 -> []
  | n -> (n-1, dummy) :: make_node_color_list (n-1) 


let rec get_color node = function
    [] -> err "no such node"
  | (node', color) :: rest ->
      if node = node' then color
      else get_color node rest

let rec get_min min = function
    [] -> min
  | head :: rest -> 
      if head < min then get_min head rest
      else get_min min rest              


let rec replace (node, color) = function
    [] -> err "no such node"
  | (node', color') :: rest ->
      if node = node' then (node, color) :: rest
      else (node', color') :: replace (node, color) rest

let rop_of_vop map = function
    Vm.Param i -> Param i
  | Vm.Local id -> 
     (match List.assoc id map with
        R reg -> Reg reg
      | L ofs -> Reg dummy)
  | Vm.Proc l -> Proc l
  | Vm.IntV i -> IntV i


(*let rec add_flag_0 = function
    [] -> []
  | head :: rest -> (head, 0) :: add_flag_0 rest


let rec mark label = function
    [] -> []  (* ここには来ないはず *)
  | (inst, flag) :: rest ->
     (match inst with
        Vm.Label label' when label = label' -> (inst, 1) :: rest
      | _ -> (inst, flag) :: mark label rest)


let preprocess map insts =
  let rec body_loop = function
      [] -> []
    | (inst, flag) as head :: rest ->
       (match inst with
          Vm.BranchIf (Local id, label) ->
           (match List.assoc id map with
              L ofs -> head :: body_loop (mark label rest)
            | _ -> head :: body_loop rest)
        | _ -> head :: body_loop rest)
  in
    let flaged_insts = add_flag_0 insts in
    body_loop flaged_insts*)


let rec get_max_tmp instrs lives max =
  match instrs with 
    [] -> max
  | (Vm.Call _) as stmt :: rest ->
      let num = List.length (
                  List.filter (fun op -> match op with Vm.Local _ -> true | _ -> false) 
                              (MySet.to_list (Dfa.get_property lives stmt Cfg.BEFORE))) in
      if max < num then get_max_tmp rest lives num
      else get_max_tmp rest lives max

let rop_of_vop = function
    Vm.Param i -> Param i
  | Vm.Local id -> err "For debug: this line cannot be done"
  | Vm.Proc l -> Proc l
  | Vm.IntV i -> IntV i

let make_assign_case_dest_is_reg dest index op map =
  match op with
    Vm.Local id ->
     (match List.assoc id map with
        R reg -> [Assign (dest, index, Reg reg)]
      | L ofs -> [Load (reserved_reg, ofs);
                  Assign (dest, index, Reg reserved_reg)])
  | _ -> [Assign (dest, index, rop_of_vop op)]

let make_assign_case_dest_is_local dest index op map available_regs =
  match op with
    Vm.Local id ->
     (match List.assoc id map with
        R reg -> [Assign (dest, index, Reg reg)]
      | L ofs -> 
          if List.length available_regs <> 0 then
            let free_reg = List.hd available_regs in
            [Load (free_reg, ofs);
             Assign (dest, index, Reg free_reg)]
          else
            [Store (0, tmp);
             Load (0, ofs);
             Assign (dest, index, Reg 0);
             Load (0, tmp)])
  | _ -> [Assign (dest, index, rop_of_vop op)]

let make_assigns dest ops map available_regs =
  let rec body_loop make_assign index = function
      [] -> []
    | head :: rest -> (make_assign dest index head map) :: body_loop make_assign (index+1) rest
  in
    match dest with
      R reg -> body_loop make_assign_case_dest_is_reg 0 ops
    | L ofs -> body_loop make_assign_case_dest_is_local 0 ops available_regs

let rec map_property prop map =
  match prop with
    [] -> []
  | Local id :: rest -> 
     (match List.assoc id map with
        R reg -> reg :: map_property rest map
      | L ofs -> map_property rest map)
  | _ -> map_property rest map


let rec make_escape_recover_instrs index = function
    [] -> ([], [])
  | head :: rest ->
      let (store, load) = make_escape_recover_instrs (index+1) rest in
      (Store (head, index) :: store, Load (head, index) :: load)

(* ==== レジスタ割付け ==== *)

let rec paint node_color adjacency_matrix now_node_color =
  let rec get_adjacent_colors neighbor = function
      [] -> []
    | 0 :: rest -> get_adjacent_colors (neighbor+1) rest
    | 1 :: rest -> (get_color neighbor node_color) :: get_adjacent_colors (neighbor+1) rest
  in
    match now_node_color with
      [] -> []
    | (node, _) :: rest ->
        let row = Array.get adjacency_matrix node in
        let adjacency_colors = get_adjacent_colors 0 (Array.to_list row) in
        let new_color = (get_min dummy adjacency_colors) + 1 in
        (node, new_color) :: paint (replace (node, new_color) node_color) adjacency_matrix rest

let make_map nreg painted_node_color =
  let rec body_loop nreg local_num = function
      [] -> 
        if local_num = 0 then ([], local_num)
        else ([], local_num + 1)
    | (node, color) :: rest ->
        if color < nreg then
          let (tail, result_local_num) = body_loop nreg local_num rest in
          ((node, R color) :: tail, result_local_num)
        else 
          let (tail, result_local_num) = body_loop nreg (local_num+1) rest in
          ((node, L (color - nreg + 3)) :: tail, result_local_num)
  in
    body_loop nreg 0 painted_node_color

let trans_inst map inst local_num lives available_regs =
  match inst with
    Vm.Move (id, op) -> 
     (match List.assoc id map, op with
        R reg, Vm.Local id' ->
         (match List.assoc id' map with
            R reg' -> [Move (reg, Reg reg')]
          | L ofs -> [Load (reg, ofs)]) 
      | R reg, _ -> [Move (reg, rop_of_vop op)] 
      | L ofs, Vm.Local id' ->
         (match List.assoc ofs' map with
            R reg -> [Store (reg, ofs)]
          | L ofs' -> [Load (reserved_reg, ofs');
                       Store (reserved_reg, ofs)])
      | L ofs, _ -> [Move (reserved_reg, rop_of_vop op);
                             Store (reserved_reg, ofs)])
  | (*Vm.BinOp (id, binOp, op1, op2) ->
     (match List.assoc id map, op1, op2 with
        R reg, Vm.Local id1, Vm.Local id2 ->
         (match List.assoc id1 map, List.assoc id2 map with
            R reg1, R reg1 -> [BinOp (reg, binOp, Reg reg1, Reg reg2)]
          | R reg1, L ofs2 -> [Load (reserved_reg, ofs2);
                               BinOp (reg, binOp, Reg reg1, Reg reserved_reg)]
          | L ofs1, R reg2 -> [Load (reserved_reg, ofs1);
                               BinOp (reg, binOp, Reg reserved_reg, Reg reg2)]
          | L ofs1, L ofs2 -> [Load (reserved_reg, ofs1);
                               Load (reg, ofs2);
                               BinOp (reg, binOp, Reg reserved_reg, Reg reg)])
      | R reg, Vm.Local id1, _ ->
         (match List.assoc id1 map with
            R reg1 -> [BinOp (reg, binOp, Reg reg1, rop_of_vop op2)]
          | L ofs1 -> [Load (reserved_reg, ofs1);
                       BinOp (reg, binOp, Reg reserved_reg, rop_of_vop op2)])
      | R reg, _, Vm.Local id2 ->
         (match List.assoc id2 map with
            R reg2 -> [BinOp (reg, binOp, rop_of_vop op1, Reg reg2)]
          | L ofs2 -> [Load (reserved_reg, ofs2);
                       BinOp (reg, binOp, rop_of_vop op1, Reg reserved_reg)])
      | R reg, _, _ -> [BinOp (reg, binOp, rop_of_vop op1, rop_of_vop op2)]
      | L ofs, Vm.Local id1, Vm.Local id2 ->
         (match List.assoc id1 map, List.assoc id2 map with
            R reg1, R reg1 -> [BinOp (reserved_reg, binOp, Reg reg1, Reg reg2);
                               Store (reserved_reg, ofs)]
          | R reg1, L ofs2 -> [Load (reserved_reg, ofs2);
                               BinOp (reserved_reg, binOp, Reg reg1, Reg reserved_reg);
                               Store (reserved_reg, ofs)]
          | L ofs1, R reg2 -> [Load (reserved_reg, ofs1);
                               BinOp (reserved_reg, binOp, Reg reserved_reg, Reg reg2);
                               Store (reserved_reg, ofs)]
          | L ofs1, L ofs2 -> 
              if List.length available_regs <> 0 then
                let free_reg = List.hd available_regs in
                [Load (reserved_reg, ofs1);
                 Load (free_reg, ofs2);
                 BinOp (reserved_reg, binOp, Reg reserved_reg, Reg free_reg);
                 Store (reserved_reg, ofs)])
              else
                [Load (reserved_reg, ofs1);
                 Store (0, tmp);
                 Load (0, ofs2);
                 BinOp (reserved_reg, binOp, Reg reserved_reg, Reg 0);
                 Store (reserved_reg, ofs);
                 Load (0, tmp)])
      | L ofs, Vm.Local id1, _ ->
         (match List.assoc id1 map with
            R reg1 -> [BinOp (reserved_reg, binOp, Reg reg1, rop_of_vop op2);
                       Store (reserved_reg, ofs)]
          | L ofs1 -> [Load (reserved_reg, ofs1);
                       BinOp (reserved_reg, binOp, Reg reserved_reg, rop_of_vop op2);
                       Store (reserved_reg, ofs)])
      | L ofs, _, Vm.Local id2 ->
         (match List.assoc id2 map with
            R reg2 -> [BinOp (reserved_reg, binOp, rop_of_vop op1, Reg reg2);
                       Store (reserved_reg, ofs)]
          | L ofs2 -> [Load (reserved_reg, ofs2);
                       BinOp (reserved_reg, binOp, rop_of_vop op1, Reg reserved_reg);
                       Store (reserved_reg, ofs)])
      | L ofs, _, _ -> [BinOp (reserved_reg, binOp, rop_of_vop op1, rop_of_vop op2);
                        Store (reserved_reg, ofs)]*)
  | Vm.BinOp (id, binOp, op1, op2) ->
      let (store, dist_reg) = 
        match List.assoc id map with 
          R reg -> ([], reg)
        | L ofs -> ([Store (reserved_reg, ofs)], reserved_reg) in
      let (load1, arg1) = 
        match op1 with
          Vm.Local id1 ->
           (match List.assoc id1 map with
              R reg -> ([], Reg reg)
            | L ofs -> ([Load (reserved_reg, ofs)], Reg reserved_reg)
        | _ -> ([], rop_of_vop op1)) in
      let (load2, arg2) =
        match op2 with
          Vm.Local id2 -> 
           (match List.assoc id2 map with
              R reg -> ([], Reg reg)
            | L ofs ->
                if List.empty load1 then ([Load (reserved_reg, ofs)], Reg reserved_reg) 
                else 
                  if List.empty available_regs then
                    ([Store (0, tmp);
                      Load (0, ofs);
                      Load (0, tmp)], Reg 0)
                  else
                    let free_reg = List.hd available_regs in
                    ([Load (free_reg, ofs)], Reg free_reg)) in
      let binOp_inst = [BinOp (dist_reg, binOp, arg1, arg2)] in
      if List.length load2 = 3 then
        let (load2', recover) = match load2 then first :: second :: [third] -> ([first; second], [third]) in
        List.concat (load1 @ load2' @ binOp_inst @ store @ recover)
      else
        List.concat (load1 @ load2 @ binOp_inst @ store)
  | Vm.Label label -> [Label label]
  | Vm.BranchIf (op, label)->
     (match op with
        Vm.Local id ->
         (match List.assoc id map with
            R reg -> [BranchIf (Reg reg, label)]
          | L ofs -> [Load (reserved_reg, ofs);
                      BranchIf (Reg reserved_reg, label)])
      | _ -> [BranchIf (rop_of_vop op, label)])
  | Vm.Goto label -> [Goto label]
  | Vm.Call (id, op, ops) ->
      let prop = Dfa.get_property lives inst Cfg.AFTER in
      let using_regs = map_property (MySet.to_list (MySet.diff prop (MySet.singleton (Local id)))) in
      let (stores, loads) = make_escape_recover_instrs (local_num + 2) using_regs in 
      let (op1, op2) = match ops with arg1 :: [arg2] -> (arg1, arg2) in
      let call_instrs =
        let (load, arg) =
          match op with
            Vm.Local id' ->
             (match List.assoc id' map with
                R reg -> ([], Reg reg)
              | L ofs -> ([Load (reserved_reg, ofs)], Reg reserved_reg))
          | _ -> ([], rop_of_vop op) in
        let (load1, arg1) ->
          match op1 with
            Vm.Local id' ->
             (match List.assoc id' map with
                R reg -> ([], Reg reg)
              | L ofs ->
                  if List.empty load then
                    ([Load (reserved_reg, ofs)], Reg reserved_reg)
                  else
                    if List.empty available_regs then
                      
          | _ -> ([], rop_of_vop op1) in
  | Vm.Return op ->
     (match op with
        Vm.Local id ->
         (match List.assoc id map with
            R reg -> [Return (Reg reg)]
          | L ofs -> [Load (reserved_reg, ofs);
                      Returm (Reg reserved_reg)])
      | _ -> [Return (rop_of_vop op)]
  | Vm.Malloc (id, ops) -> 
      let dest = List.assoc id map in
      (Malloc (dest, List.length ops)) :: List.concat (make_assigns dest ops map available_regs)
  | Vm.Read (id, op, i) ->
     (match List.assoc id map, op with
        R reg, Vm.Local id' ->
         (match List.assoc id' map with
            R reg' -> [Read (reg, Reg reg', i)]
          | L ofs -> [Load (reserved_reg, ofs);
                      Read (reg, Reg reserved_reg, i)])
      | R reg, _ -> [Read (reg, rop_of_vop op, i)]
      | L ofs, Vm.Local id' ->
         (match List.assoc id' map with
            R reg -> [Read (reserved_reg, Reg reg, i);
                      Store (reserved_reg, ofs)]
          | L ofs' -> [Load (reserved_reg, ofs');
                       Read (reserved_reg, Reg reserved_reg, i);
                       Store (reserved_reg, ofs)])
      | L ofs, _ -> [Read (reserved_reg, rop_of_vop op, i);
                     Store (reserved_reg, ofs)])

let trans_instrs nreg lives map local_num regs instrs =
  let rec body_loop = function
    [] -> []
  | head :: rest ->
      let prop = Dfa.get_property lives head Cfg.BEFORE in
      let using_regs = MySet.from_list (map_property (MySet.to_list prop) map) in
      let available_regs = MySet.diff regs using_regs in
      trans_inst
  in
    body_loop instrs
      

let trans_decl nreg lives (Vm.ProcDecl (lbl, nlocal, instrs)) =
  let props = get_properties_as_list lives instrs in
  let ofses = trans_props_from_op_to_ofs props in
  let node_color = make_node_color_list nlocal in
  let adjacency_matrix = make_adjacency_matrix ofses nlocal in
  let (map, local_num) = make_map nreg (paint node_color adjacency_matrix node_color) in
  let new_nlocal = local_num + get_max_tmp instrs lives 0 in
  let insts' = [Load (reserved_reg, 1)] in
  ProcDecl (lbl, new_nlocal, insts')

(* entry point *)
let trans nreg lives = List.map (trans_decl nreg lives)
