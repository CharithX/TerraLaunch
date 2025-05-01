resource "aws_vpc" "ultron_vpc" {
cidr_block = var.cidr_block

 tags = {
    Name= var.aws_vpc_name
}
 } 

resource "aws_subnet" "ultron_subnet_private1" {
  vpc_id     = aws_vpc.ultron_vpc.id
  cidr_block = var.subnet_cidr_block_private1

  tags = {
    Name = var.aws_subnet_name_private1
  }
}

resource "aws_subnet" "bhu_subnet_public1" {
  vpc_id     = aws_vpc.ultron_vpc.id
  cidr_block = var.subnet_cidr_block_public1
  map_public_ip_on_launch = true 

  tags = {
    Name = var.aws_subnet_name_public1
  }
}

resource "aws_route_table" "ultron_route_table_private1" {
  vpc_id = aws_vpc.ultron_vpc.id

  tags = {
    Name = var.aws_route_table_private1
  }
  
}

resource "aws_route_table" "bhu_route_table" {
  vpc_id = aws_vpc.ultron_vpc.id
  
    tags = {
    Name = var.aws_route_table_public1
  }
}


resource "aws_internet_gateway" "ultron_igw" {
  vpc_id = aws_vpc.ultron_vpc.id

  tags = {
    Name = var.aws_igw_bhu
  }
}

resource "aws_route" "bhu_public_internet_access" {
  route_table_id         = aws_route_table.bhu_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ultron_igw.id
}


resource "aws_route_table_association" "ultron_route_table_associate_private1" {
  subnet_id      = aws_subnet.ultron_subnet_private1.id
  route_table_id = aws_route_table.ultron_route_table_private1.id
}

resource "aws_route_table_association" "bhu_route_table_associate_public1" {
  subnet_id      = aws_subnet.bhu_subnet_public1.id
  route_table_id = aws_route_table.bhu_route_table.id
}


output "ultron_vpc_id" {
  value = aws_vpc.ultron_vpc.id
}

output "ultron_subnet_id" {
  value = aws_subnet.ultron_subnet_private1.id
}
output "bhu_subnet_id" {
  value = aws_subnet.bhu_subnet_public1.id
}