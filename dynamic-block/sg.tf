
resource "aws_security_group" "roboshop-sg" {
  name = "roboshop-strict-security-group" #local


  egress {
    from_port   = 0 #opening all ports
    to_port     = 0
    protocol    = "-1"          #all protocols
    cidr_blocks = ["0.0.0.0/0"] #internet

  }
  dynamic "ingress" {
    for_each = toset(var.ingress-ports)
    content {

      from_port   = ingress.value #opening all ports and ingress is special keywords
      to_port     = ingress.value
      protocol    = "tcp"         #if opening a specific port "tcp"          #all protocols
      cidr_blocks = ["0.0.0.0/0"] #internet


    }
  }

  tags = {
    Name = "terraform-strict-sg" #local
  }

}
