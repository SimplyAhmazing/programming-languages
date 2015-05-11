fun compose (f, g) = fn x => f (g x)

(* equivalent to above *)

fun sqrt_of_abs i = Math.sqrt( Real.fromInt( abs i))

fun sqrt_of_abs2 i = (Math.sqrt o Real.fromInt o abs) i

(* fun sqrt_of_abs3 i = Math.sqrt o Real.fromInt o abs i *)

fun backup1(f, g) = fn x => case f x of
                                None => g x
                              | SOME => y

fun backup2(f, g) = f x handle _ => g x

