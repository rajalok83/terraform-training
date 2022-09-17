resource "aws_instance" "example"{
  ami           = "ami-006d3995d3a6b963b"
  instance_type = "t2.nano"
  tags = {
  Name = "alok-example"
}
}
