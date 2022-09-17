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



resource "aws_security_group" "allow_web" {
  name        = "${var.name}_sg"
}
resource "aws_instance" "web"  {
  ami           = var.ec2_dtl.ami
  instance_type = var.ec2_dtl.instance_type
  key_name = "alok-key"
  tags = var .ec2_tag
  vpc_security_group_ids               = [
        "${aws_security_group.allow_web.id}",
  ]
  user_data = file("web.sh")
#   user_data = "#!/bin/bash && sudo echo '' > && sudo apt-get update && sudo apt-get install -y apache2 && echo '<h1>Welcome to Terraform World!</h1>' | sudo tee /var/www/html/index.html && sudo systemctl start apache2 && sudo systemctl enable apache2"
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.allow_web.id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "http_rule" {
  type              = "ingress"
  from_port         = 0
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = "${aws_security_group.allow_web.id}"
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 0
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = "${aws_security_group.allow_web.id}"
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
output "URL" {
  value = "http://${aws_instance.web.public_ip}"
}
