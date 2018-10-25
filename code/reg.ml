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
  | Malloc   of dest * operand list
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
  | Malloc (t, vs) ->
      idt ^ "new" ^ tab ^ string_of_dest t ^ " [" ^
      (String.concat ", " (List.map string_of_operand vs)) ^ "]"
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

let string_of_id id = string_of_int id

let rec string_of_ofs = function
    [] -> ""
  | head :: rest -> (string_of_id head) ^ ";" ^ (string_of_ofs rest)

let rec string_of_ofses = function
    [] -> ""
  | head :: rest -> (string_of_ofs head) ^ " ; " ^ (string_of_ofses rest)


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
      [] -> ([], local_num)
    | (node, color) :: rest ->
        if color < nreg then
          let (tail, result_local_num) = body_loop nreg local_num rest in
          ((node, R color) :: tail, result_local_num)
        else 
          let (tail, result_local_num) = body_loop nreg (local_num+1) rest in
          ((node, L (color - nreg + 2)) :: tail, result_local_num)
  in
    body_loop nreg 0 painted_node_color

(*let trans_inst map = function
    Vm.Move (id, op) ->*)

let trans_decl nreg lives (Vm.ProcDecl (lbl, nlocal, instrs)) =
  let props = get_properties_as_list lives instrs in
  let ofses = trans_props_from_op_to_ofs props in
  let node_color = make_node_color_list nlocal in
  let adjacency_matrix = make_adjacency_matrix ofses nlocal in
  let (map, local_num) = make_map nreg (paint node_color adjacency_matrix node_color) in
  let insts' = [Load (0, 1)] in
  ProcDecl (lbl, 0, insts')

(* entry point *)
let trans nreg lives = List.map (trans_decl nreg lives)
