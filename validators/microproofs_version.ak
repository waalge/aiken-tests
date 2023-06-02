
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


test list_fields_unwr_0() {
  when data_fields() is {
    [_, Fields { b, .. }, ..] ->
      b > 0
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

