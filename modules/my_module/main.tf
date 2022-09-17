provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_access_key
}

resource "aws_instance" "web"  {
  ami           = var.ec2_dtl.ami
  instance_type = var.ec2_dtl.instance_type
  tags = {
    Name = var.ec2_dtl.tag
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
