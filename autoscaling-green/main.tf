
#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#

provider "aws" {
  region = "us-east-1"
}

module "autoscaling" {
  source = "./autoscaling"
  name = "asg-green"
  create_launch_template = true
  vpc_zone_identifier       = ["subnet-0fec1c333f1102177", "subnet-0627134b377a726cc", "subnet-04fd4db7826f66c33", "subnet-06cb25bce70542cb3", "subnet-080a9fbfbff7ac240", "subnet-061cd375781c4ae05"]
  load_balancers            = ["wezvatech"]
  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  health_check_type         = "EC2"
  health_check_grace_period = 30

  launch_template_name        = "lt-blue"
  image_id          = "ami-0ecb62995f68bb549"
  key_name          = "wezvatech2025"
  instance_type     = "t3.micro"
  security_groups   = ["sg-0327e8b83cf57b213"]
}

#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#
