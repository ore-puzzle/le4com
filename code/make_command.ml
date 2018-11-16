let filenames = ref [||]

let rec make_assemble = function
    [] -> ""
  | head :: rest ->
      "gcc -o bin/" ^ head ^ " lib/main.c " ^ "assembly/" ^ head ^ ".s\n" ^ 
      "gcc -o bin/" ^ head ^ "opt" ^ " lib/main.c " ^ "assembly/" ^  head ^ "opt.s\n" ^
      make_assemble rest

let rec make_do = function
    [] -> ""
  | head :: rest ->
      "bin/" ^ head ^ "\n" ^ 
      "bin/" ^ head ^ "opt\n" ^
      make_do rest

let _ = 
  filenames := Sys.argv;
  let assemble = make_assemble (List.tl (Array.to_list !filenames)) in
  let dO = make_do (List.tl (Array.to_list !filenames)) in
  let oc1 = open_out "assemble.sh" in
  let oc2 = open_out "do.sh" in
  output_string oc1 assemble;
  output_string oc2 dO;
  close_out oc1;
  close_out oc2
  
