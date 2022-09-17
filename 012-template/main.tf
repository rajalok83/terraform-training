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

data "template_file" "abc" {
  template = "${file("${path.module}/user_data")}"
}

resource "aws_instance" "web"  {
  ami           = var.ec2_dtl.ami
  instance_type = "${trimspace(data.template_file.abc.rendered)}"
  tags = {
    Name = "alok-template"
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

