# DNS hosted zone setup

## prerequisites

AWS `access key` and `secret key` should be added in environment variables

create a `AWS S3 bucket and dynamodb table` to store terraform state files


### Execution steps

Run `terraform init` to configure terraform remote backend "S3" and fetch terraform modules

Update DNS zone name in `terraform.tfvars`

Run `terraform apply` to create services in aws


Now go to regional network folder to create aws VPC
