## Create SG 
resource "aws_security_group" "web_sg" {
  name   = "${var.web_sg_name}"
  vpc_id = "${data.aws_vpc.app.id}"

  tags {
    Name          = "${var.web_sg_name}"
    "Application" = "${var.Application}"
    "Environment" = "${var.Environment}"
    "owner"       = "${var.owner}"
  }
}

## Insert ingress RULE
resource "aws_security_group_rule" "ingress1" {
  security_group_id = "${aws_security_group.web_sg.id}"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["10.10.0.0/16"]
}

## Insert egress RULE
resource "aws_security_group_rule" "egress1" {
  security_group_id = "${aws_security_group.web_sg.id}"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

#### Web ELB SG
## Create SG
resource "aws_security_group" "web_lb_sg" {
  name   = "${var.web_lb_sg_name}"
  vpc_id = "${data.aws_vpc.app.id}"

  tags {
    Name          = "${var.web_lb_sg_name}"
    "Application" = "${var.Application}"
    "Environment" = "${var.Environment}"
    "owner"       = "${var.owner}"
  }
}

## Insert ingress RULE
resource "aws_security_group_rule" "ingress2" {
  security_group_id = "${aws_security_group.web_lb_sg.id}"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

## Insert egress RULE
resource "aws_security_group_rule" "egress2" {
  security_group_id = "${aws_security_group.web_lb_sg.id}"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

