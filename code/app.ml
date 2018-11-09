let rec app = fun f -> fun x -> f x in app (fun x -> x * 2) 3;;
