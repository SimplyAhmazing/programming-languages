fun sum_of_triple triple =
  let val (x,y,z) = triple
  in
    x + y + z
  end


fun sum_of_triple (x, y, z) = x + y + z


fun full_name {first=x, middle=y, last=z} = x ^ " " ^ y ^ " " ^ z
