output vpc {
  value = "${module.appvpc.vpc_id}"
}

output db_subnets {
  value = "${module.appvpc.db_subnets}"
}

output web_private_subnets {
  value = "${module.appvpc.web_private_subnets}"
}

output app_private_subnets {
  value = "${module.appvpc.app_private_subnets}"
}

output public_subnets {
  value = "${module.appvpc.public_subnets}"
}
