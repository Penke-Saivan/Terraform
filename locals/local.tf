locals{
    instance_type= "t3.micro"
}

locals {
  common_name= "${var.project}-${var.environemnt}" #using vars inside local
}