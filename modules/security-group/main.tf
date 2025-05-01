resource "aws_security_group" "ultron_sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = module.vpc.ultron_vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

   tags = {
    Name = var.sg_name
  }

}
output "sg_id" {
  value = aws_security_group.ultron_sg.id
}
