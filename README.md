# terraform
this repo uses terraform modules to create aws infra

here webapp is application name and env1 is environment name

Each environment has two directories [Execute terraform apply in same order ]

1. Global = Global services should be created here i.e. DNS, IAM user

2. Region = Regional services should be created here i.e VPC, ELB, EC2, RDS

2.1 Network = Regional VPC should be created here

2.2 Service = Regional service components should be created here i.e. ASG, ELB, RDS
