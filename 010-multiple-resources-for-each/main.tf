terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_access_key
}


resource "aws_instance" "web"  {
  for_each = toset(["t2.micro", "t2.nano"])
  ami           = var.ec2_dtl.ami
  instance_type = "${each.key}"
  tags = {
    Name = "alok-${each.key}"
  }
}

//resource "aws_instance" "example" {
//  for_each = { "dev" = { Name="alok", Type="micro"} }
//  ami           = var.ec2_dtl.ami
//  instance_type = "t2.${each.value.Type}"
//  tags = { Name = "${each.value.Name}-${each.key}" }
//}


// output "PublicIP" {
//   value = aws_instance.web[*].public_ip
// }

//output "PublicDNS" {
//  value = aws_instance.web[*].public_dns
//}

//output "State" {
//  value = aws_instance.web[*].instance_state
//}

