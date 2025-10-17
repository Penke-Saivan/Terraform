resource "aws_instance" "terraforma" {
  ami           = var.ami_id #RHEL-9-DevOps-Practice 
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_tf.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_all_tf" {
  name   = "allow-all-tf"
description = "Terr Managed "

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
