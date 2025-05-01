module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  aws_vpc_name = "ultron-vpc" 
  aws_subnet_name_private1 = "ultron_subnet_private1"
  subnet_cidr_block_private1 = "10.0.1.0/24"
  aws_subnet_name_public1 = "bhu_subnet_public1"
  subnet_cidr_block_public1 = "10.0.2.0/24"
  aws_route_table_private1 = "ultron_route_table_private1"
  aws_route_table_public1 = "bhu_route_table" 
  aws_igw_bhu = "ultron_igw"

}
# module "security_group" {
#   source = "./modules/security-group"
#   sg_name = "ultron-sg"
#   sg_description = "Security group for Ultron"
#   # vpc_id = module.vpc.ultron_vpc_id
# }

module "ec2" {
  source = "./modules/ec2"
  ami_id = "ami-0b5eea76982371e91"
  ultron_instance_type = "t2.medium"
  bhu_instance_type = "t2.micro"
  ultron_ec2_private1 = "ultron_ec2_pri1"
  bhu_ec2_public1 =  "bhu_ec2_pub1"
  ultron_key_name = "ultron-key"
  bhu_key_name = "bhu-key"
  security_group_ids  = [module.security_group.sg_id]
}

