### Common values
region = "ap-northeast-2"

Application = "web"

Environment = "env1"

owner = "terraform"

### ASG values
web_sg_name = "web_tier_sg"

web_lb_sg_name = "web_tier_lb_sg"

ami = "ami-c74789a9"

instance_type = "t2.micro"

ssh_key = "testkey"

ebs_type = "gp2"

ebs_size = "10"

ebs_delete = "true"

asg_name = "web-asg"

max_size = "1"

min_size = "1"

launch_time = "300"

health_check_type = "ELB"

#### ELB values

lb_type = "clb"

elb_name = "web-elb"

internal = "false"

instance_port = "80"

instance_protocol = "http"

lb_port = "80"

lb_protocol = "http"

healthy_threshold = "5"

healthcheck_interval = "30"

target_check = "http:80/healthcheck"

healthcheck_timeout = "5"

unhealthy_threshold = "5"

cross_zone_load_balancing = "true"

idle_timeout = "120"

conn_drain = "1"

conn_drain_timeout = "300"

##### DNS record 
dns_name = "web_dns_name"

type = "CNAME"
