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
      idt ^ "asn" ^ tab ^ string_of_operand v ^ " #" ^ string_of_int i 
      ^ "(" ^ string_of_dest t ^ ") "
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
let dummy = -1 (* 最初に塗られている色 (一部他の使い方） *)

let tmp = 0 (* レジスタを一時的に退避する空間 *)

(* ==== for debug ==== *)

let string_of_id id = string_of_int id

let rec string_of_ofs = function
    [] -> ""
  | head :: rest -> (string_of_id head) ^ ";" ^ (string_of_ofs rest)

let rec string_of_ofses = function
    [] -> ""
  | head :: rest -> (string_of_ofs head) ^ " ; " ^ (string_of_ofses rest)

let string_of_vop = function
    Vm.Param i -> "p" ^ string_of_int i
  | Vm.Local id -> "t" ^ string_of_int id
  | Vm.Proc l -> l
  | Vm.IntV i -> string_of_int i

let rec string_of_prop = function
    [] -> ""
  | head :: rest -> (string_of_vop head) ^ " ; " ^ (string_of_prop rest) 

let string_of_dest = function
    R reg -> "r" ^ string_of_int reg
  | L ofs -> "t" ^ string_of_int ofs

let rec string_of_map = function
    [] -> ""
  | (a, b) :: rest ->
      "(" ^ (string_of_int a) ^ ", " ^ (string_of_dest b) ^ ")" ^ "; " ^
      (string_of_map rest)

let rec string_of_node_color = function
    [] -> ""
  | (node, color) :: rest ->
      "(" ^ (string_of_int node) ^ ", " ^ (string_of_int color) ^ ")" ^ "; " ^
      (string_of_node_color rest)

let string_of_int_list l =
  let rec body_loop = function
      [] -> ""
    | i :: rest -> string_of_int i ^ ";" ^ body_loop rest
  in
    "[" ^ body_loop l ^ "]"

let string_of_int_list_list l = 
  let rec body_loop = function
      [] -> ""
    | i_list :: rest -> string_of_int_list i_list ^ ";" ^ body_loop rest
  in
    "[" ^ body_loop l ^ "]"

(* ==== support function ==== *)
(* 生存変数解析の結果からプロパティを取り出す関数 *)
let rec get_properties_as_list lives = function
    [] -> []
  | stmt :: rest -> 
     (match stmt with
        Vm.Label _ -> get_properties_as_list lives rest (* ラベルにプロパティはない *)
      | _ -> (MySet.to_list (Dfa.get_property lives stmt Cfg.BEFORE)) ::
             (MySet.to_list (Dfa.get_property lives stmt Cfg.AFTER)) ::
              get_properties_as_list lives rest)

(* プロパティからParamを取り除いてLocalだけにする関数 *)
let rec trans_props_from_op_to_ofs = function
    [] -> []
  | prop :: rest ->
      List.map (fun (Vm.Local ofs) -> ofs) 
               (List.filter                                 (* 解析に使ったdummyもはじく *)
                 (fun op -> match op with Vm.Local ofs when ofs <> -1 -> true | _ -> false) prop) ::
      trans_props_from_op_to_ofs rest

(* 隣接行列を生成する関数 *)
(* ofses = リストのリストで、各要素の中に含まれているofsは同時に生存している *)
let make_adjacency_matrix ofses size instrs =
  (* すべて0の行列、これを書き換えていく *)
  let matrix = Array.make_matrix size size 0 in
  let rec outer_loop = function
      [] -> ()
    | head :: rest -> inner_loop head; outer_loop rest
  and inner_loop = function (* このリストに含まれているofsは同時に生存している *) 
      [] -> ()
    | head :: rest -> 
        for i = 0 to (List.length rest) - 1 do (* headはrestの要素たちと同時に生存している *)
          matrix.(head).(List.nth rest i) <- 1;
          matrix.(List.nth rest i).(head) <- 1  (* 対称行列になる *)
        done;
        inner_loop rest 
  (* MallocをMallocとAssignに分割するので、そこの干渉もチェック *)
  (* この干渉は生存変数解析からはわからない(AssignはここRegで初めて現れるため） *)
  and outer_loop_for_asn = function
      [] -> ()
    | Vm.Malloc (id, ops) :: rest -> inner_loop_for_asn id ops; outer_loop_for_asn rest
  and inner_loop_for_asn ofs = function
      [] -> () (* Mallocのopsは空ではあり得ないので実行されない *)
    | head :: rest ->
       (match head with
          Vm.Local ofs' -> (* Mallocの格納先と格納されるものは同時に生存している *)
            matrix.(ofs).(ofs') <- 1;
            matrix.(ofs').(ofs) <- 1;
            inner_loop_for_asn ofs rest
        | _ -> inner_loop_for_asn ofs rest)
  in
    outer_loop ofses;
    outer_loop_for_asn (List.filter (fun instr -> match instr with Vm.Malloc _ -> true | _ -> false) instrs);
    matrix

(* 頂点と色の組を生成する関数 *)
let rec make_node_color_list node_num =
  match node_num with
    0 -> []
   (* 最初はすべてdummyで塗られている *)
  | n -> (n-1, dummy) :: make_node_color_list (n-1) 

(* 頂点と色の組を、頂点の次数の昇順にソートする関数 *)
let sort_by_degree node_color adjacency_matrix =
  let f nc1 nc2 =
    let (n1, _) = nc1 in
    let (n2, _) = nc2 in
    (* 隣接行列の各行の要素の和が次数となる *)
    let degree_of_n1 = Array.fold_left (+) 0 adjacency_matrix.(n1) in
    let degree_of_n2 = Array.fold_left (+) 0 adjacency_matrix.(n2) in
    if degree_of_n1 < degree_of_n2 then -1
    else if degree_of_n1 = degree_of_n2 then 0
    else 1 in
  List.stable_sort f node_color (* stable_sortにしたのはデバッグのため *)

(* 頂点と色の組から、ある頂点の色を得る関数 *)
let rec get_color node = function
    [] -> err "no such node"
  | (node', color) :: rest ->
      if node = node' then color
      else get_color node rest

(* リスト中の最大値を返す関数 *)
let rec get_max max = function
    [] -> max
  | head :: rest -> 
      if max < head then get_max head rest
      else get_max max rest              

(* 頂点と色の組において、ある頂点の色を変える関数 *)
let rec replace (node, color) = function
    [] -> err "no such node"
  | (node', color') :: rest ->
      if node = node' then (node, color) :: rest
      else (node', color') :: replace (node, color) rest

(* Vm.operand -> Reg.operand *)
let rop_of_vop = function
    Vm.Param i -> Param i
  | Vm.Local id -> err "For debug: this line cannot be done"
  | Vm.Proc l -> Proc l
  | Vm.IntV i -> IntV i

(* Assignの命令列を生成する関数 *)
let make_assigns dest ops map =
  let make_assign index op =
    match op with
      Vm.Local id ->
       (match List.assoc id map with
          R reg -> [Assign (dest, index, Reg reg)]
        | L ofs -> [Load (reserved_reg, ofs);
                    Assign (dest, index, Reg reserved_reg)])
    |   _ -> [Assign (dest, index, rop_of_vop op)] in
  let rec body_loop index = function
      [] -> []
    | head :: rest -> (make_assign index head) :: body_loop (index+1) rest
  in
    body_loop 0 ops

(* プロパティ中のofsをマップされているレジスタに変換する関数 *)
let rec map_property prop map =
  match prop with
    [] -> []
  | Vm.Local id :: rest when id <> -1 -> 
     (match List.assoc id map with
        R reg -> reg :: map_property rest map
      | L ofs -> map_property rest map) (* Lは無視 *)
  | _ :: rest -> map_property rest map

(* 関数呼び出しの直後に生きていて、かつその結果を格納したものではないレジスタの数の最大値を得る関数 *)
let rec get_max_tmp instrs lives map max =
  match instrs with 
    [] -> max
  | (Vm.Call (id, _, _)) as stmt :: rest ->
      let prop = Dfa.get_property lives stmt Cfg.AFTER in
      let should_escaped_regs = map_property (MySet.to_list (MySet.diff prop (MySet.singleton (Vm.Local id)))) map in
      let num = List.length should_escaped_regs in
      if max < num then get_max_tmp rest lives map num
      else get_max_tmp rest lives map max
  | _ :: rest -> get_max_tmp rest lives map max

(* 関数呼び出しの際のレジスタの退避/復帰の命令列を生成する関数 *)
let rec make_escape_recover_instrs index = function
    [] -> ([], [])
  | head :: rest ->
      let (store, load) = make_escape_recover_instrs (index+1) rest in
      (Store (head, index) :: store, Load (head, index) :: load)

(* 使えるレジスタのリストを返す関数 *)
let make_regs nreg = (* nregは1以上と想定 *)
  let rec body_loop num =
    if num = 0 then
      [num]
    else
      num :: body_loop (num - 1)
  in
    List.rev (body_loop (nreg - 1))

(* ==== レジスタ割付け ==== *)
(* 頂点を彩色していく関数 *)
(* node_color = 実際に色が塗られていく頂点と色の組、常に全体を表す
   now_node_color = ループを回すための頂点と色の組、一つ前のループのrest *)
let rec paint node_color adjacency_matrix now_node_color =
  (* 隣接している頂点の色の集合(dummyは除く)を得るための関数 *)
  let rec get_adjacent_colors neighbor = function
      [] -> []
    | 0 :: rest -> get_adjacent_colors (neighbor+1) rest
    | 1 :: rest -> (get_color neighbor node_color) :: get_adjacent_colors (neighbor+1) rest
  in
    match now_node_color with
      [] -> []
    | (node, _) :: rest ->
        let row = Array.get adjacency_matrix node in
        let adjacent_colors = get_adjacent_colors 0 (Array.to_list row) in
        let new_color = (get_max dummy adjacent_colors) + 1 in
        (node, new_color) :: paint (replace (node, new_color) node_color) adjacency_matrix rest

(* 彩色された頂点集合と汎用レジスタの数から、色からレジスタまたはローカル領域へのマップを作る関数 *)
let make_map nreg painted_node_color =
  (* local_numは現時点での局所変数の数を表す *)
  let rec body_loop nreg local_num = function
      [] -> 
        if local_num = 0 then ([], local_num)
        else ([], local_num + 1) (* 局所変数が一つでもある場合は退避のための領域をもう一つ確保する *)
    | (node, color) :: rest ->
        if color < nreg then
          let (tail, result_local_num) = body_loop nreg local_num rest in
          ((node, R color) :: tail, result_local_num)
        else  (* あふれた分はローカル領域にマップ *)
          let (tail, result_local_num) = body_loop nreg (local_num+1) rest in
          ((node, L (color - nreg + 1)) :: tail, result_local_num) (* 0は退避のために空けておく *)
  in
    body_loop nreg 0 painted_node_color

(* Callを変換する関数 *)
(* あまりに巨大になったので分けた *)
(* 関数を表すopと引数を表すop1、op2がLocalかどうかで8通りに場合分けして、
   さらに、そのLocalがレジスタかローカル領域のどちらにマップされているかで場合分け *)
(* ローカル領域にマップされているものは
   reserved_reg > 空いているレジスタ > 関数呼び出しのためにすでに退避したレジスタ の順に
   レジスタに読み出してからCallする *)
let make_call_instr dest op op1 op2 available_regs escaped_regs map =
  match op, op1, op2 with
    Vm.Local id, Vm.Local id1, Vm.Local id2 ->
     (match List.assoc id map, List.assoc id1 map, List.assoc id2 map with
        R reg, R reg1, R reg2 ->
          [Call (dest, Reg reg, [Reg reg1; Reg reg2])]
      | R reg, R reg1, L ofs2 ->
          [Load (reserved_reg, ofs2);
           Call (dest, Reg reg, [Reg reg1; Reg reserved_reg])]
      | R reg, L ofs1, R reg2 ->
          [Load (reserved_reg, ofs1);
           Call (dest, Reg reg, [Reg reserved_reg; Reg reg2])]
      | R reg, L ofs1, L ofs2 ->
          let reg_for_op2 =
            if List.length available_regs <> 0 then
              List.hd available_regs
            else
              List.hd (MySet.to_list (MySet.remove reg (MySet.from_list escaped_regs))) in
          [Load (reserved_reg, ofs1);
           Load (reg_for_op2, ofs2);
           Call (dest, Reg reg, [Reg reserved_reg; Reg reg_for_op2])]
      | L ofs, R reg1, R reg2 ->
          [Load (reserved_reg, ofs);
           Call (dest, Reg reserved_reg, [Reg reg1; Reg reg2])]
      | L ofs, R reg1, L ofs2 ->
          let reg_for_op2 =
            if List.length available_regs <> 0 then
              List.hd available_regs
            else
              List.hd escaped_regs in
          [Load (reserved_reg, ofs);
           Load (reg_for_op2, ofs2);
           Call (dest, Reg reserved_reg, [Reg reg1; Reg reg_for_op2])]
      | L ofs, L ofs1, R reg2 ->
          let reg_for_op1 =
            if List.length available_regs <> 0 then
              List.hd available_regs
            else
              List.hd (MySet.to_list (MySet.remove reg2 (MySet.from_list escaped_regs))) in
          [Load (reserved_reg, ofs);
           Load (reg_for_op1, ofs1);
           Call (dest, Reg reserved_reg, [Reg reg_for_op1; Reg reg2])]
      | L ofs, L ofs1, L ofs2 ->
          let reg_for_op1 =
            if List.length available_regs <> 0 then
              List.hd available_regs
            else 
              List.hd escaped_regs in
          let reg_for_op2 =
            if  List.length available_regs >= 2 then
              List.nth available_regs 1
            else if List.length available_regs = 1 then
              List.hd escaped_regs 
            else
              List.nth escaped_regs 1 in
          [Load (reserved_reg, ofs);
           Load (reg_for_op1, ofs1);
           Load (reg_for_op2, ofs2);
           Call (dest, Reg reserved_reg, [Reg reg_for_op1; Reg reg_for_op2])])
    | Vm.Local id, Vm.Local id1, _ ->
       (match List.assoc id map, List.assoc id1 map with
          R reg, R reg1 ->
            [Call (dest, Reg reg, [Reg reg1; rop_of_vop op2])]
        | R reg, L ofs1 ->
            [Load (reserved_reg, ofs1);
             Call (dest, Reg reg, [Reg reserved_reg; rop_of_vop op2])]
        | L ofs, R reg1 ->
            [Load (reserved_reg, ofs);
             Call (dest, Reg reserved_reg, [Reg reg1; rop_of_vop op2])]
        | L ofs, L ofs1 ->
            let reg_for_op1 =
              if List.length available_regs <> 0 then
                List.hd available_regs
              else
                List.hd escaped_regs in
            [Load (reserved_reg, ofs);
             Load (reg_for_op1, ofs1);
             Call (dest, Reg reserved_reg, [Reg reg_for_op1; rop_of_vop op2])])
    | Vm.Local id, _, Vm.Local id2 ->
       (match List.assoc id map, List.assoc id2 map with
          R reg, R reg2 ->
            [Call (dest, Reg reg, [rop_of_vop op1; Reg reg2])]
        | R reg, L ofs2 ->
            [Load (reserved_reg, ofs2);
             Call (dest, Reg reg, [rop_of_vop op1; Reg reserved_reg])]
        | L ofs, R reg2 ->
            [Load (reserved_reg, ofs);
             Call (dest, Reg reserved_reg, [rop_of_vop op1; Reg reg2])]
        | L ofs, L ofs2 ->
            let reg_for_op2 =
              if List.length available_regs <> 0 then
                List.hd available_regs
              else
                List.hd escaped_regs in
            [Load (reserved_reg, ofs);
             Load (reg_for_op2, ofs2);
             Call (dest, Reg reserved_reg, [rop_of_vop op1; Reg reg_for_op2])])
    | Vm.Local id, _, _ ->
       (match List.assoc id map with
          R reg ->
            [Call (dest, Reg reg, [rop_of_vop op1; rop_of_vop op2])]
        | L ofs ->
            [Load (reserved_reg, ofs);                 
             Call (dest, Reg reserved_reg, [rop_of_vop op1; rop_of_vop op2])])
    | _, Vm.Local id1, Vm.Local id2 ->
       (match List.assoc id1 map, List.assoc id2 map with
          R reg1, R reg2 ->
            [Call (dest, rop_of_vop op, [Reg reg1; Reg reg2])]
        | R reg1, L ofs2 ->
            [Load (reserved_reg, ofs2);
             Call (dest, rop_of_vop op, [Reg reg1; Reg reserved_reg])]
        | L ofs1, R reg2 ->
            [Load (reserved_reg, ofs1);
             Call (dest, rop_of_vop op, [Reg reserved_reg; Reg reg2])]
        | L ofs1, L ofs2 ->
            let reg_for_op2 =
              if List.length available_regs <> 0 then
                List.hd available_regs
              else 
                List.hd escaped_regs in
            [Load (reserved_reg, ofs1);
             Load (reg_for_op2, ofs2);
             Call (dest, rop_of_vop op, [Reg reserved_reg; Reg reg_for_op2])])
    | _, Vm.Local id1, _ ->
       (match List.assoc id1 map with
          R reg1 ->
            [Call (dest, rop_of_vop op, [Reg reg1; rop_of_vop op2])]
        | L ofs1 ->
            [Load (reserved_reg, ofs1);                 
             Call (dest, rop_of_vop op, [Reg reserved_reg; rop_of_vop op2])])
    | _, _, Vm.Local id2 ->
       (match List.assoc id2 map with
          R reg2 ->
            [Call (dest, rop_of_vop op, [rop_of_vop op1; Reg reg2])]
        | L ofs2 ->
            [Load (reserved_reg, ofs2);                 
             Call (dest, rop_of_vop op, [rop_of_vop op1; Reg reserved_reg])])
    | _, _, _ ->
        [Call (dest, rop_of_vop op, [rop_of_vop op1; rop_of_vop op2])] 

(* 実際にVmからRegに変換する関数 *)
(* Callの場合にレジスタを退避しなければならないので、引数にいろいろある *)
let trans_inst map inst lives local_num available_regs =
  match inst with
    Vm.Move (id, op) -> 
     (match List.assoc id map, op with
        R reg, Vm.Local id' ->
         (match List.assoc id' map with
            R reg' -> [Move (reg, Reg reg')]
          | L ofs' -> [Load (reg, ofs')]) 
      | R reg, _ -> [Move (reg, rop_of_vop op)] 
      | L ofs, Vm.Local id' ->
         (match List.assoc id' map with
            R reg' -> [Store (reg', ofs)]
          | L ofs' -> [Load (reserved_reg, ofs');
                       Store (reserved_reg, ofs)])
      | L ofs, _ -> [Move (reserved_reg, rop_of_vop op);
                     Store (reserved_reg, ofs)])
  | Vm.BinOp (id, binOp, op1, op2) ->
      let (store, dest_reg) = 
        match List.assoc id map with 
          R reg -> ([], reg)
        | L ofs -> ([Store (reserved_reg, ofs)], reserved_reg) in
      let (load1, arg1) = 
        match op1 with
          Vm.Local id1 ->
           (match List.assoc id1 map with
              R reg -> ([], Reg reg)
            | L ofs -> ([Load (reserved_reg, ofs)], Reg reserved_reg))
        | _ -> ([], rop_of_vop op1) in
      let (load2, arg2) =
        match op2 with
          Vm.Local id2 -> 
           (match List.assoc id2 map with
              R reg -> ([], Reg reg)
            | L ofs ->
                (* op1がローカル領域にマップされた変数でなければ *)
                if List.length load1 = 0 then ([Load (reserved_reg, ofs)], Reg reserved_reg)
                (* op1がローカル領域にマップされた変数ならば *)
                else 
                  if List.length available_regs <> 0 then
                    let free_reg = List.hd available_regs in
                    ([Load (free_reg, ofs)], Reg free_reg)                    
                  else (* 空いているレジスタがなければV1を退避してそこに読みだす *)
                    ([Store (0, tmp);
                      Load (0, ofs);
                      Load (0, tmp)], Reg 0))
        | _ -> ([], rop_of_vop op2) in
      let binOp_inst = [BinOp (dest_reg, binOp, arg1, arg2)] in
      (* V1を退避させていたなら *)
      if List.length load2 = 3 then
        let (load2', recover) = match load2 with first :: second :: [third] -> ([first; second], [third]) in
        load1 @ load2' @ binOp_inst @ store @ recover
      else
        load1 @ load2 @ binOp_inst @ store
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
      (* この命令の後に生きているもので、この命令の結果が格納されているものではないレジスタ群 *)
      let should_escaped_regs = map_property (MySet.to_list (MySet.diff prop (MySet.singleton (Vm.Local id)))) map in
      let (stores, loads) = make_escape_recover_instrs local_num should_escaped_regs in 
      let dest = List.assoc id map in
      let (op1, op2) = match ops with arg1 :: [arg2] -> (arg1, arg2) in
      let call_instrs = make_call_instr dest op op1 op2 available_regs should_escaped_regs map in
      stores @ call_instrs @ loads     
  | Vm.Return op ->
     (match op with
        Vm.Local id ->
         (match List.assoc id map with
            R reg -> [Return (Reg reg)]
          | L ofs -> [Load (reserved_reg, ofs);
                      Return (Reg reserved_reg)])
      | _ -> [Return (rop_of_vop op)])
  | Vm.Malloc (id, ops) -> 
      let dest = List.assoc id map in
      (Malloc (dest, List.length ops)) :: List.concat (make_assigns dest ops map)
  | Vm.Read (id, op, i) ->
      let dest = List.assoc id map in
      match op with
        Vm.Local id' ->
         (match List.assoc id' map with
            R reg' -> [Read (dest, Reg reg', i)]
          | L ofs' -> [Load (reserved_reg, ofs');
                       Read (dest, Reg reserved_reg, i)])
      | _ -> [Read (dest, rop_of_vop op, i)]

(* 命令を変換させていく関数 *)
(* 空いているレジスタを得るためにList.mapではなくループにした *)
let trans_instrs nreg lives map regs local_num instrs =
  let rec body_loop = function
    [] -> []
  | head :: rest ->
      let prop = 
        match head with
          Vm.Label _ -> MySet.empty (* ラベルにプロパティはない *)
        | _ -> Dfa.get_property lives head Cfg.BEFORE in 
      let using_regs = MySet.from_list (map_property (MySet.to_list prop) map) in
      let available_regs = MySet.to_list (MySet.diff regs using_regs) in 
      (trans_inst map head lives local_num available_regs) :: body_loop rest
  in
    body_loop instrs
      

let trans_decl nreg lives (Vm.ProcDecl (lbl, nlocal, instrs)) =
  (* すべてのプロパティを得る *)
  let props = get_properties_as_list lives instrs in
  (* プロパティをローカル変数のオフセットに変換する *)
  let ofses = trans_props_from_op_to_ofs props in
  (* 頂点と色の組を作る(まだ色はdummy) *)
  let node_color = List.rev (make_node_color_list nlocal) in
  (* 隣接行列を作る *)
  let adjacency_matrix = make_adjacency_matrix ofses nlocal instrs in
  (* 頂点と色の組を頂点の次数によってソート *)
  let ordered_node_color = sort_by_degree node_color adjacency_matrix in
  (* 頂点に色を塗って、レジスタ、あるいはローカル領域へのマップを作る *)
  let (map, local_num) = make_map nreg (paint ordered_node_color adjacency_matrix ordered_node_color) in
  (* 確保すべきローカル領域を得る *)
  let new_nlocal = local_num + get_max_tmp instrs lives map 0 in
  (* 使えるレジスタの集合 *)
  let regs = MySet.from_list (make_regs nreg) in
  (* 命令を変換 *)
  let insts' = trans_instrs nreg lives map regs local_num instrs in
  ProcDecl (lbl, new_nlocal, List.concat insts')

(* entry point *)
let trans nreg lives = List.map (trans_decl nreg lives)
