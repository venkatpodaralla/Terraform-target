resource "aws_instance" "my-first-server" {
  ami           = "ami-01cae1550c0adea9c"
  instance_type = "t2.micro"
}
