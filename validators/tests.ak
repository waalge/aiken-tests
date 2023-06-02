use aiken/list.{at}

fn data() {
  [1, 2, 3]
}

test list_at() {
  expect Some(x) =
    data() |> at(1)
  x == 2
}

test list_no_at() {
  when data() is {
    [_, x, ..] ->
      x == 2
    _ ->
      False
  }
}

test list_at_2() {
  expect Some(x) =
    data() |> at(1)
  expect Some(y) =
    data() |> at(2)
  x == 2 && y == 3
}

test list_no_at_2() {
  when data() is {
    [_, x, y, ..] ->
      x == 2 && y == 3
    _ ->
      False
  }
}

type Fields {
  a: Int,
  b: Int,
  c: ByteArray,
}

fn data_fields() {
  [
    Fields { a: 1, b: 2, c: "hello" },
    Fields { a: 4, b: 5, c: "hello" },
    Fields { a: 7, b: 8, c: "hello" },
  ]
}

test fields_accessor_1() {
  let f =
    Fields { a: 1, b: 2, c: "hello" }
  f.a == 1
}

test fields_accessor_2() {
  let f =
    Fields { a: 1, b: 2, c: "hello" }
  f.a == 1 && f.b == 2
}

test fields_unwr_1() {
  let Fields { a, .. } =
    Fields { a: 1, b: 2, c: "hello" }
  a == 1
}

test fields_unwr_2() {
  let Fields { a, b, .. } =
    Fields { a: 1, b: 2, c: "hello" }
  a == 1 && b == 2
}

test fields_at() {
  expect Some(x) =
    data_fields() |> at(1)
  x.b == 5
}

test fields_no_at() {
  when data_fields() is {
    [_, x, ..] ->
      x.b == 5
    _ ->
      False
  }
}

test list_fields_unwr_1() {
  when data_fields() is {
    [_, Fields { b, .. }, ..] ->
      b > 0
    _ ->
      False
  }
}

test list_fields_unwr_0() {
  when data_fields() is {
    [Fields { b, .. }, ..] ->
      b > 0
    _ ->
      False
  }
}

test list_fields_unwr_0_alt() {
  when data_fields() is {
    [x, ..] -> { 
      let Fields { b, .. } = x 
      b > 0
    }
    _ ->
      False
  }
}

test fields_at_2() {
  expect Some(x) =
    data_fields() |> at(1)
  expect Some(y) =
    data_fields() |> at(2)
  x.b == 5 && y.b == 8
}

test fields_mo_at_2() {
  when data_fields() is {
    [_, x, y, ..] ->
      x.b == 5 && y.b == 8
    _ ->
      False
  }
}
