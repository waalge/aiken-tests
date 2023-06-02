type Fields {
  a: ByteArray,
  b: Int,
}

fn data_fields(){
  [
      Fields{a: #"", b: 14}, 
      Fields{a: #"AA", b: 1}
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

