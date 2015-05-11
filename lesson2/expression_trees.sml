

datatype exp =
    Constant of int
  | Negate of exp
  | Add of exp * exp
  | Multiply of exp * exp


fun eval e =
  case e of
        Constant i => i
      | Negate e2 => ~ (eval e2)
      | Add(e1, e2) => (eval e1) + (eval e2)
      | Multiply(e1, e2) => (eval e1) * (eval e2)


fun max_constant e =
    case e of
          Constant i => i
        | Negate e2 => max_constant e2
        | Add(e1, e2) => if max_constant e1 > max_constant e2
                         then max_constant e1
                         else max_constant e2
        | Multiply(e1, e2) => if max_constant e1 > max_constant e2
                         then max_constant e1
                         else max_constant e2

(* Make max_constant more DRY *)
fun max_constant2 e =
    case e of
          Constant i => i
        | Negate e2 => max_constant e2
        | Add(e1, e2) =>
            let val m1 = max_constant e1
                val m2 = max_constant e2
            in if m1 > m2 then m1 else m2 end
        | Multiply(e1, e2) =>
            let val m1 = max_constant e1
                val m2 = max_constant e2
            in if m1 > m2 then m1 else m2 end


(* Make max_constant more DRY *)
fun max_constant3 e =
    let fun max_of_two(e1, e2) =
      let val m1 = max_constant3 e1
          val m2 = max_constant3 e2
      in
        (* if m1 > m2 then m1 else m2 *)
        Int.max(m1, m2)
      end
    in
    case e of
          Constant i => i
        | Negate e2 => max_constant3 e2
        | Add(e1, e2) => max_of_two(e1, e2)
        | Multiply(e1, e2) => max_of_two(e1, e2)
    end


fun max_constant4 e =
    let fun max_of_two(e1, e2) = Int.max(max_constant4 e1, max_constant4 e2)
    in
      case e of
            Constant i => i
          | Negate e2 => max_constant4 e2
          | Add(e1, e2) => max_of_two(e1, e2)
          | Multiply(e1, e2) => max_of_two(e1, e2)
    end

fun max_constant5 e =
    case e of
          Constant i => i
        | Negate e2 => max_constant5 e2
        | Add(e1, e2) => Int.max(max_constant5 e1, max_constant5 e2)
        | Multiply(e1, e2) => Int.max(max_constant5 e1, max_constant5 e2)


(* Add (Constant (10+9), Negate (Constant 4)) *)
val x: exp =  Add (Constant (10+9), Negate (Constant 4));

val test_exp =  Add(Constant 19,  Negate (Constant 4));

val nineteen = max_constant test_exp;
val nineteen_2 = max_constant2 test_exp;
val nineteen_3 = max_constant3 test_exp;
val nineteen_4 = max_constant4 test_exp;
val nineteen_5 = max_constant5 test_exp;
