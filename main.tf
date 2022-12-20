resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = var.aws_vpc
  cidr_block = "10.1.0.0/26"
}

resource "aws_subnet" "MY-subnet-1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = var.subnet-1a

  tags = {
    Name = "My-subnet-1"
  }
}

resource "aws_subnet" "MY-subnet-2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = var.subnet-1b
  
  tags = {
    Name = "My-subnet-2"
  }
}
