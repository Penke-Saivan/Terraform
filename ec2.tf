resource "aws_instance" "terraforma" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
    Terraform = "true"
  }
}