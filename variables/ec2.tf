resource "aws_instance" "terraforma" {
  ami           = var.ami_id #RHEL-9-DevOps-Practice 
  instance_type = var.instance_typo
  vpc_security_group_ids = [aws_security_group.allow_all_tf.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_all_tf" {
  name   = var.sg_name
description = "Terr--- Managed "

  egress {
    from_port   = var.egress_from_port #opening all ports
    to_port     = var.egress_to_port
    protocol    = "-1" #all protocols
    cidr_blocks = var.cidr #internet

  }

  ingress {
    from_port   = var.ingress_from_port #opening all ports
    to_port     = var.ingress_to_port
    protocol    = "-1" #all protocols
    cidr_blocks = var.cidr #internet

  }

  tags= {
    Name = "allow-all-terraform" 
  }
lifecycle {
  ignore_changes = [ description ]
}
}
