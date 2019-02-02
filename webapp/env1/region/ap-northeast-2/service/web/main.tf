module "web_tier_asg" {
  source = "github.com/vikkyomkar/terraform-modules//asg"

  ami               = "${var.ami}"
  instance_type     = "${var.instance_type}"
  ssh_key           = "${var.ssh_key}"
  ebs_type          = "${var.ebs_type}"
  sg                = ["${aws_security_group.web_sg.id}"]
  subnets           = ["${data.aws_subnet.web_private.*.id}"]
  ebs_size          = "${var.ebs_size}"
  ebs_delete        = "${var.ebs_delete}"
  asg_name          = "${var.Environment}-${var.asg_name}"
  max_size          = "${var.max_size}"
  min_size          = "${var.min_size}"
  launch_time       = "${var.launch_time}"
  health_check_type = "${var.health_check_type}"
  Application       = "${var.Application}"
  Environment       = "${var.Environment}"
  owner             = "${var.owner}"
}

module "web_tier_elb" {
  source = "github.com/vikkyomkar/terraform-modules//elb"

  lb_type              = "${var.lb_type}"
  elb_name             = "${var.elb_name}"
  internal             = "${var.internal}"
  instance_port        = "${var.instance_port}"
  sg                   = ["${aws_security_group.web_lb_sg.id}"]
  subnets              = ["${data.aws_subnet.public.*.id}"]
  instance_protocol    = "${var.instance_protocol}"
  lb_port              = "${var.lb_port}"
  lb_protocol          = "${var.lb_protocol}"
  healthy_threshold    = "${var.healthy_threshold}"
  healthcheck_interval = "${var.healthcheck_interval}"
  target_check         = "${var.target_check}"
  healthcheck_timeout  = "${var.healthcheck_timeout}"

  unhealthy_threshold       = "${var.unhealthy_threshold}"
  cross_zone_load_balancing = "${var.cross_zone_load_balancing}"
  idle_timeout              = "${var.idle_timeout}"
  conn_drain                = "${var.conn_drain}"
  conn_drain_timeout        = "${var.conn_drain_timeout}"

  Application = "${var.Application}"
  Environment = "${var.Environment}"
  owner       = "${var.owner}"
}

### attach ELB to ASG 
resource "aws_autoscaling_attachment" "app_tier_attach" {
  autoscaling_group_name = "${element(module.web_tier_asg.asg_id,0)}"
  elb                    = "${element(module.web_tier_elb.lb_id,0)}"
}
