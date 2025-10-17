variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "ec2_tags" {
  type = map
  default = {
    Name      = "Terra-2"
    Terraform = true
  }

}
