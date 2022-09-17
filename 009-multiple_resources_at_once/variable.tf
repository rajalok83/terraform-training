// Declare variable
//variable "varname" {
//  default = []
//}
//Print variable
//output "a" {
// value = var.varname[index]
//}

variable "my_list" {
   default = ["1", "2", "3"]
 
}

output "a" {
 value = var.my_list[0]

}

variable "my_str" {
  type = string
  default = "Hello my world"
}

output "b" {
  value = var.my_str
}

variable "access_key" {
  type = string
  default = "put_your_access_key_here"
}

variable "secret_access_key" {
  type = string
  default = "put_your_secret_access_key_here"
}
variable "region" {
  type = string
  default = "ap-south-1"
}
variable "ec2_dtl" {
  type = map  
  default = {name = "web",
  ami = "ami-006d3995d3a6b963b",
  instance_type = "t2.micro",
  tag = "alok-instance"
  }
}
variable "ec2_tag" {
  default = { Name = "alok-instance" }
}
variable "ec2_key" {
  default = ""
}
