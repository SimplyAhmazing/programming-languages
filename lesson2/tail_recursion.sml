fun my_len xs =
  let fun accum (ys, acc) =
    case ys of
        [] => acc
      | x::ys' => accum(ys', acc + 1)
  in
    accum(xs, 0)
  end
