terraform {
  backend "s3" {
    bucket         = "vikky-terraform-state"
    key            = "terraform/webapp/env1/region/ap-northeast-2/network/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "vikky-terraform-lock"
  }
}
