aws_vpc = var.aws_vpc

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = var.aws_vpc
  cidr_block = "10.1.0.0/26"
}
