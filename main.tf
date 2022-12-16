resource "aws_instance" "my-first-server" {
  ami           = "ami-01cae1550c0adea9c"
  instance_type = "t2.micro"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/26"
}

resource "aws_subnet" "Private-subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/27"
}
resource "aws_subnet" "Private-subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.32/27"
}
