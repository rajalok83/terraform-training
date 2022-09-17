resource "random_integer" "num" {
  min = 1
  max = 50000
}
output "RANDINT" {
  value = random_integer.num.result
}

