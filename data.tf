data "aws_ami" "my_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-ecs-hvm-*-kernel-6.1-x86_64"] #dev - ami-00889ad21b50fe113
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "ena-support"
    values = ["true"]
  }
}

data "aws_availability_zones" "available" {}
data "aws_vpc" "3tier_vpc" {
  id = var.vpc_id
}
data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = var.public_subnets
  }
}
data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:Name"
    values = var.private_subnets
  }
}
