resource aws_instance "ultron_ec2_private1" {
    ami = var.ami_id
    instance_type = var.ultron_instance_type
    subnet_id = module.vpc.ultron_subnet_id
    key_name = var.ultron_key_name
    tags = {
        Name = var.ultron_ec2_private1   
    }

}

resource "aws_instance" "bhu_ec2_public1" {
    ami = var.ami_id
    instance_type = var.bhu_instance_type
    subnet_id = module.vpc.bhu_subnet_id
    key_name = var.bhu_key_name
    associate_public_ip_address = true
    tags = {
        Name = var.bhu_ec2_public1
    }
}

resource "tls_private_key" "ultron_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ultron_key" {
  key_name   = "ultron-key"
  public_key = tls_private_key.ultron_key.public_key_openssh
}

resource "tls_private_key" "bhu_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "bhu-key" {
  key_name   = "bhu-key"
  public_key = tls_private_key.bhu_key.public_key_openssh
}

resource "local_file" "ultron_private_key" {
  content         = tls_private_key.ultron_key.private_key_pem
  filename        = "/c/Users/Lakshan/Desktop/terraform-Full-app/keys/ultron_key.pem"
  file_permission = "0400"  # Restrict permissions for security
}

resource "local_file" "bhu_private_key" {
  content         = tls_private_key.bhu_key.private_key_pem
  filename        = "/c/Users/Lakshan/Desktop/terraform-Full-app/keys/bhu_key.pem"
  file_permission = "0400"  # Restrict permissions for security
}