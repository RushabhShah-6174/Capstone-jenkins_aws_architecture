
#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#
provider "aws" {
  region = "us-east-1"
}

module "elb" {
  source = "./loadbalancer"
  vpc_id = "vpc-07b7d4d9fcb30fce9"
  internal        = false

  sg_public_ingress = [
    {
      description = "Allows HTTP traffic"
      port        = 80
      protocol    = "tcp"
    },
  ]

  sg_public_egress  =  [443,8080]

  subnets         = ["subnet-0fec1c333f1102177", "subnet-0627134b377a726cc", "subnet-04fd4db7826f66c33", "subnet-06cb25bce70542cb3", "subnet-080a9fbfbff7ac240", "subnet-061cd375781c4ae05"]

  listener = [
    {
      instance_port     = 8080
      instance_protocol = "http"
      lb_port           = 80
      lb_protocol       = "http"
      #ssl_certificate_id = "arn:aws:acm:eu-west-1:235367859451:certificate/6c270328-2cd5-4b2d-8dfd-ae8d0004ad31"
    },
  ]

  health_check = {
     target              = "TCP:8080"
     interval            = 30
     healthy_threshold   = 2
     unhealthy_threshold = 2
     timeout             = 5
  }
}

#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#

