module "appvpc" {
  source = "github.com/vikkyomkar/terraform-modules//vpc"

  vpc_name       = "${var.vpc_name}"
  vpc_cidr_block = "${var.vpc_cidr_block}"
  zones          = "${var.zones}"

  db_subnets          = "${var.db_subnets}"
  web_private_subnets = "${var.web_private_subnets}"
  app_private_subnets = "${var.app_private_subnets}"
  public_subnets      = "${var.public_subnets}"
}
