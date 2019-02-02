# DB component creation
This will create only SG

## Execution steps

Run `terraform init` to configure terraform remote backend "S3" and fetch terraform modules

Update values in `terraform.tfvars` to make the changes

Run `terraform apply` to create DB component in aws

