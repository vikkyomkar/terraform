vpc_name = "adplat"

region = "ap-northeast-2"

vpc_cidr_block = "10.10.0.0/16"

zones = ["ap-northeast-2a", "ap-northeast-2c"]

public_subnets = ["10.10.1.0/24", "10.10.2.0/24"]

web_private_subnets = ["10.10.11.0/24", "10.10.12.0/24"]

app_private_subnets = ["10.10.21.0/24", "10.10.22.0/24"]

db_subnets = ["10.10.51.0/24", "10.10.52.0/24"]
