datatype sgn = P | N | Z

fun multsign (x1, x2) = (* int * int -> sgn *)
  let fun sign x = if x=0 then Z else if x > 0 then P else N
  in
    case (sign x1, sign x2) of
          (Z,_) => Z
        | (_,Z) => Z
        | (P,P) => P
        | (N,N) => P
        | _ => N  (* This is a catch all... *)
  end

(* Use a wildcard '_' to ignore variables you're not using*)
fun len xs =
  case xs of
        [] => 0
      | _::xs' => 1 + len xs'  
