data "aws_vpc" "selected" {
  id = vpc-076239dcee15756e8
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc
  cidr_block = "10.1.0.0/26"
}
