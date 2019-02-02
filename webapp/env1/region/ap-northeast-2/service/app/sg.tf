## Create SG 
resource "aws_security_group" "app_sg" {
  name   = "${var.app_sg_name}"
  vpc_id = "${data.aws_vpc.app.id}"

  tags {
    Name          = "${var.app_sg_name}"
    "Application" = "${var.Application}"
    "Environment" = "${var.Environment}"
    "owner"       = "${var.owner}"
  }
}

## Insert ingress RULE
resource "aws_security_group_rule" "ingress1" {
  security_group_id = "${aws_security_group.app_sg.id}"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["10.10.11.0/24", "10.10.12.0/24"]
}

## Insert egress RULE
resource "aws_security_group_rule" "egress1" {
  security_group_id = "${aws_security_group.app_sg.id}"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
