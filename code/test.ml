let matrix =
    [|[|0;0;0;0;0;0;0;0;0;0|];
      [|0;0;1;1;1;1;1;1;1;1|];
      [|0;1;0;1;1;1;1;0;0;0|];
      [|0;1;1;0;0;0;0;0;0;0|];
      [|0;1;1;0;0;0;0;0;0;0|];
      [|0;1;1;0;0;0;0;0;0;0|];
      [|0;1;1;0;0;0;0;1;1;1|];
      [|0;1;0;0;0;0;1;0;0;0|];
      [|0;1;0;0;0;0;1;0;0;1|];
      [|0;1;0;0;0;0;1;0;1;0|]|];;

let dummy = -1;;

let rec get_color node = function
    [] -> -2
  | (node', color) :: rest ->
      if node = node' then color
      else get_color node rest

let rec get_max max = function
    [] -> max
  | head :: rest -> 
      if max < head then get_max head rest
      else get_max max rest              


let rec replace (node, color) = function
    [] -> []
  | (node', color') :: rest ->
      if node = node' then (node, color) :: rest
      else (node', color') :: replace (node, color) rest

let sort_by_degree node_color adjacency_matrix =
  let f nc1 nc2 =
    let (n1, _) = nc1 in
    let (n2, _) = nc2 in
    let degree_of_n1 = Array.fold_left (+) 0 adjacency_matrix.(n1) in
    let degree_of_n2 = Array.fold_left (+) 0 adjacency_matrix.(n2) in
    if degree_of_n1 < degree_of_n2 then -1
    else if degree_of_n1 = degree_of_n2 then 0
    else 1 in
  List.sort f node_color                   ;;

let node_color =
    [(0, -1); (1, -1); (2, -1); (3, -1); (4, -1); (5, -1);
     (6, -1); (7, -1); (8, -1); (9, -1)];;

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
        let adjacent_colors = get_adjacent_colors 0 (Array.to_list row) in
        let new_color = (get_max dummy adjacent_colors) + 1 in
        (node, new_color) :: paint (replace (node, new_color) node_color) adjacency_matrix rest

