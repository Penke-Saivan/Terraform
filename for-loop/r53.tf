resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.terraforma
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  #   records = [ec2_instance_output[count.index].private_ip]
  records         = [each.value.private_ip]
  allow_overwrite = true
}
