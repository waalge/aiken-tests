
type Fields {
  a: Int,
  b: Int,
}

fn data_fields() {
  [
    Fields { a: 1, b: 2,  },
    Fields { a: 4, b: 5,  },
    Fields { a: 7, b: 8,  },
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

