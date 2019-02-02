##########################
#ROUTE53 RECORD
#########################
resource "aws_route53_record" "record" {
  zone_id = "${data.aws_route53_zone.dns_zone.zone_id}"
  name    = "${var.dns_name}"
  type    = "${var.type}"
  ttl     = "${var.ttl}"
  records = ["${module.web_tier_elb.lb_dns_name}"]
}
