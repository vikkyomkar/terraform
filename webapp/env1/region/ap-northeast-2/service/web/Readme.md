# Web component creation
This will create ASG [ Private subnet ], ELB [ public subnet], SG and a DNS record

## Execution steps

Run `terraform init` to configure terraform remote backend "S3" and fetch terraform modules

Update values in `terraform.tfvars` to make the changes

Run `terraform apply` to create web component in aws

