
data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = var.vpc_id
  cidr_block = "10.1.0.0/26"
}
