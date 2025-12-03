
#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#

provider "aws" {
  region = "us-east-1"
}

variable "default_vpc_id" {
 default = "vpc-07b7d4d9fcb30fce9"
}

variable "default_subnet_id" {
 default = ["subnet-0fec1c333f1102177", "subnet-0627134b377a726cc", "subnet-04fd4db7826f66c33", "subnet-06cb25bce70542cb3", "subnet-080a9fbfbff7ac240", "subnet-061cd375781c4ae05"]
}

resource "aws_efs_file_system" "wezvatech" {
  creation_token = "jrp"
  encrypted = true

  tags = {
    Name = "jrp"
  }
}

resource "aws_efs_mount_target" "example" {
 for_each = toset(var.default_subnet_id)
 file_system_id = aws_efs_file_system.wezvatech.id
 subnet_id = each.key
}

#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#
