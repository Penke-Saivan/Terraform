resource "aws_instance" "terraforma" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = local.instance_type #local
  vpc_security_group_ids = [aws_security_group.allow_all_tf.id]

  tags = merge(var.common_tags, {
    Name= "${local.common_name}-locals-demo" #local
  })
}

resource "aws_security_group" "allow_all_tf" {
  name   = "${local.common_name}-allow-all" #local
 

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
    Name = "${local.common_name}-allow-all" #local
  }

}
