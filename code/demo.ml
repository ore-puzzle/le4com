let rec add1and2 = fun x -> x + 1 + 2 in

let rec demo_reg = fun x ->
  let a = x + 1 in
  let b = x + 2 in
  let c = x + 3 in
  let d = x + 4 in
  let e = x + 5 in
  let f = x + 6 in
  let g = x + 7 in
  let sum = a + b + c + d + e + f + g in
  let sum_plus3 = add1and2 sum in
  sum_plus3 + a + c in

let rec demo_opt = fun n ->
let x = 1 in
let y = x in
let z = if 0 < y then y else n in
z in

(demo_reg 1) + (demo_opt 10);;

