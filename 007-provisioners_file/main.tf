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

resource "aws_key_pair" "alok-key"{
key_name = "alok-key"
// public_key = "put_your_public_ssh_key_here"
public_key = file("d:\\Users\\alokr\\.ssh\\id_rsa.pub")
}

resource "aws_instance" "web"  {
  ami           = var.ec2_dtl.ami
  instance_type = var.ec2_dtl.instance_type
  key_name = "alok-key"
  tags = var .ec2_tag
  provisioner "file" {
    source = "test.sh"
    destination = "/tmp/test.sh"
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("d:\\Users\\alokr\\.ssh\\id_rsa")}"
      host = "${self.public_ip}"
    }
  }
  provisioner "local-exec"{
    command = "echo ${self.private_ip} > file.txt"
  }
}

output "PublicIP" {
  value = aws_instance.web.public_ip
}

output "PublicDNS" {
  value = aws_instance.web.public_dns
}

output "State" {
  value = "Current state is ${aws_instance.web.instance_state}"
}

