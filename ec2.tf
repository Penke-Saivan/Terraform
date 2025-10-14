resource "aws_instance" "terraforma" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_tf.id]

  tags = {
    Name      = "HelloWorld" #Name of the instance and also present in tags section in AWS
    Terraform = "true"
  }
}

resource "aws_security_group" "allow_all_tf" {
  name   = "allow-all-tf"


  egress {
    from_port   = 0 #opening all ports
    to_port     = 0
    protocol    = "-1" #all protocols
    cidr_blocks = ["0.0.0.0/0"] #internet

  }

  ingress {
    from_port   = 0 #opening all ports
    to_port     = 0
    protocol    = "-1" #all protocols
    cidr_blocks = ["0.0.0.0/0"] #internet

  }

  tags= {
    Name = "allow-all-terraform" 
  }

}
