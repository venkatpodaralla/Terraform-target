variable "vpc-076239dcee15756e8" {}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc
  cidr_block = "172.2.0.0/16"
}
