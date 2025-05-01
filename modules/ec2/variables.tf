variable "ami_id" {
    type = string
}
variable "ultron_ec2_private1" {
    type = string
}

variable "bhu_ec2_public1" {
    type = string
}
variable "ultron_instance_type" {
    type = string
}

variable "bhu_instance_type" {
    type = string
}
variable "ultron_key_name" {
  description = "Name of the key pair for ultron EC2 instance"
  type = string
}

variable "bhu_key_name" {
  description = "Name of the key pair for bhu EC2 instance"
  type = string
}

variable "security_group_ids" {
  type = list(string)
}
