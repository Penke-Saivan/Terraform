resource "aws_instance" "terraforma" {
  ami           = ""
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}