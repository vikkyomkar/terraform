terraform {
  backend "s3" {
    bucket         = "vikky-terraform-state"
    key            = "terraform/webapp/env1/region/ap-northeast-2/service/db/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "vikky-terraform-lock"
  }
}

# global
data "terraform_remote_state" "global" {
  backend = "s3"

  config {
    bucket = "vikky-terraform-state"
    key    = "terraform/webapp/env1/global/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

## network
data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "vikky-terraform-state"
    key    = "terraform/webapp/env1/region/ap-northeast-2/network/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

data "aws_vpc" "app" {
  id = "${data.terraform_remote_state.network.vpc}"
}

data "aws_subnet" "db_subnets" {
  count = "${length(data.terraform_remote_state.network.db_subnets)}"
  id    = "${element(data.terraform_remote_state.network.db_subnets, count.index)}"
}
