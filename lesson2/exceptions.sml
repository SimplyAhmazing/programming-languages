(* Exceptions are runtime errors  *)


fun my_hd x =
  case x of
        [] => raise List.Empty
      | x::_ => x


exception MyUndesirableCondition

fun maxlist (xs, ex) =
  case xs of
        [] => raise ex
      | x::[] => x
      | x::xs' => Int.max(x, maxlist(xs', ex))


val w = maxlist([1,2,3,2,1], MyUndesirableCondition)

val z = maxlist([], MyUndesirableCondition)
        handle MyUndesirableCondition => 777
