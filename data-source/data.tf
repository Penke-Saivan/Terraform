#to get AMI related info
data "aws_ami" "example" {

  most_recent = true

  owners = ["973714476881"] #Owner ID

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_id" {
  value = data.aws_ami.example
}

# to get instance related info

data "aws_instance" "cart" {
  instance_id = "i-0327d2e16ea4e1255"
}

output "cart_info" {
  value = data.aws_instance.cart
}
