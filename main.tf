resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/26"
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.0.0/26"
}
