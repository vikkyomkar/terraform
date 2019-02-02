## Create SG 
resource "aws_security_group" "db_sg" {
  name   = "${var.db_sg_name}"
  vpc_id = "${data.aws_vpc.app.id}"

  tags {
    Name          = "${var.db_sg_name}"
    "Application" = "${var.Application}"
    "Environment" = "${var.Environment}"
    "owner"       = "${var.owner}"
  }
}

## Insert ingress RULE
resource "aws_security_group_rule" "ingress1" {
  security_group_id = "${aws_security_group.db_sg.id}"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["10.10.21.0/24", "10.10.22.0/24"]
}

## Insert egress RULE
resource "aws_security_group_rule" "egress1" {
  security_group_id = "${aws_security_group.db_sg.id}"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  type              = "egress"
  cidr_blocks       = ["10.10.21.0/24", "10.10.22.0/24"]
}
