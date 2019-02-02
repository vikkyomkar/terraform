# Network creation
This will create three tier application as mentioned below

1. public subnets [to expose application to users via ELB]
2. `Web tier` is in private subnets [for security]
3. `app tier` is in private subnets [for security]
4. `DB tier` is in private subnets [for security]

## Execution steps

Run `terraform init` to configure terraform remote backend "S3" and fetch terraform modules

Update below values in `terraform.tfvars`

|Value| Description|
|----------|-----------------|
| vpc_name | Name of the VPC |
|region| aws region name|
|vpc_cidr_block| unique VPC cidr block|
|zones|list of availability zones|
|public_subnets| list of public subnet cidr|
|web_private_subnets|list of web private subnet cidr|
|app_private_subnets|list of app private subnet cidr|
|db_subnets|list of db subnet cidr|

Run `terraform apply` to create network in aws

Now go to `service folder` to create ASG, ELB, SG 
