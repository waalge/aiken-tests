use aiken/list.{ length }

test fmt() {
  let x = 1 - 1
  let y = 2 - 2
  let z = []
  (x == y) && ((z |> length()) == x)
}