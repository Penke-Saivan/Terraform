resource "aws_route53_record" "roboshop" {
  count   = 2
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  #   records = [ec2_instance_output[count.index].private_ip]
  records         = [aws_instance.terraforma[count.index].private_ip]
  allow_overwrite = true
}
