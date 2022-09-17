terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "put_your_access_key_here"
  secret_key = "put_your_secret_access_key_here"
}

resource "aws_instance" "web" {
  ami           = "ami-006d3995d3a6b963b"
  instance_type = "t2.micro"

  tags = {
    Name = "user105-instance"
  }
}
