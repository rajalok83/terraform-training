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
  count = "${var.create_instance == true ? 2 : 0}"
  ami           = var.ec2_dtl.ami
  instance_type = "t2.micro"
  tags = {
    Name = "alok-${count.index}"
  }
}


// output "PublicIP" {
//   value = aws_instance.web[*].public_ip
// }

//output "PublicDNS" {
//  value = aws_instance.web[*].public_dns
//}

//output "State" {
//  value = aws_instance.web[*].instance_state
//}

