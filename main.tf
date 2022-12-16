resource "aws_instance" "my-first-server" {
  ami           = "ami-074dc0a6f6c764218"
  instance_type = "t2.micro"
