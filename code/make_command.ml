let filenames = ref [||]

let rec make_command = function
    [] -> ""
  | head :: rest ->
      "./" ^ head ^ "\n" ^
      "./" ^ head ^ "opt\n" ^
      make_command rest
let _ = 
  filenames := Sys.argv;
  let str = make_command (List.tl (Array.to_list !filenames)) in
  let oc = open_out "do.sh" in
  output_string oc str;
  close_out oc;
  
