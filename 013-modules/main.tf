module "my_module" {
  source = "d:\\PortableAppSuite\\Documents\\Training\\JPMC-Terraform\\modules\\my_module"
  ec2_dtl = { name = "web",
  ami = "ami-006d3995d3a6b963b",
  instance_type = "t2.nano",
  tag = "alok-module"
  }
}

output "MyPublicIP"{
  value = module.my_module.PublicIP
}

output "MyPublicDNS"{
  value = module.my_module.PublicDNS
}
