variable "cidr_block" {
    type = string
}

variable "aws_vpc_name" {
    type = string  
}

variable "aws_subnet_name_private1" {
    type = string
}
variable "subnet_cidr_block_private1" {
    type = string
}
variable "aws_subnet_name_public1" {
    type = string
}
variable "subnet_cidr_block_public1" {
    type = string   
}
variable "aws_route_table_private1" {
    type = string 
}
variable "aws_route_table_public1" {
    type = string
}
variable "aws_igw_bhu" {
    type = string
}