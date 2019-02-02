#######################
#ROUTE53 Zone Creation
#####################
resource "aws_route53_zone" "dns_zone" {
  name = "${var.zone_name}"

  tags {
    Name      = "${var.zone_name}"
    terraform = "true"
  }
}

output "dns_zone" {
  value = "${aws_route53_zone.dns_zone.zone_id}"
}
