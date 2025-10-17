locals {
  instance_type = "t3.micro"
  common_name   = "${var.project}-${var.environemnt}" #using vars inside local
  aws_id        = data.aws_ami.example.id
  ec2_tags = merge(var.common_tags, {
    Name = "${local.common_name}-locals-demo" #local
  })
}

# locals {

# }
