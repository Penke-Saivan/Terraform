resource "aws_instance" "terraforma" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_tf.id]

  tags = {
    Name      = "HelloWorld-TFf" #Name of the instance and also present in tags section in AWS
    Terraform = "true"
  }
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.public_ip}"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
    on_failure = continue
  }
    provisioner "local-exec" {
    command = "echo 'instance is destroyed'"
    when = destroy
  }

}

resource "aws_security_group" "allow_all_tf" {
  name = "allow-all-tf"


  egress {
    from_port   = 0 #opening all ports
    to_port     = 0
    protocol    = "-1"          #all protocols
    cidr_blocks = ["0.0.0.0/0"] #internet

  }

  ingress {
    from_port   = 0 #opening all ports
    to_port     = 0
    protocol    = "-1"          #all protocols
    cidr_blocks = ["0.0.0.0/0"] #internet

  }

  tags = {
    Name = "allow-all-terraform"
  }

}

# aws_security_group.allow_all_tf: Creating...
# aws_security_group.allow_all_tf: Creation complete after 5s [id=sg-032ae383a4e6e96cf]
# aws_instance.terraforma: Creating...
# aws_instance.terraforma: Still creating... [00m10s elapsed]
# aws_instance.terraforma: Provisioning with 'local-exec'...
# aws_instance.terraforma (local-exec): Executing: ["cmd" "/C" "echo The server's IP address is 172.31.21.61"]
# aws_instance.terraforma (local-exec): The server's IP address is 172.31.21.61
# aws_instance.terraforma: Creation complete after 16s [id=i-011754a029bf6e490]
# Releasing state lock. This may take a few moments...

# Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
