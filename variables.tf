variable "vpc_cidr" {
  description = "Main VPC ID CIDR"
  type        = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Main VPC public subnet CIDR"
  type        = string
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_app_subnet_cidrs" {
  description = "Main VPC private application subnet CIDR"
  type        = string
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_db_subnet_cidrs" {
  description = "Main VPC private database subnet CIDR"
  type        = string
  default = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1" # Mumbai (change if needed)
}


#
variable "region" { type = string }
variable "cluster_name" { type = string }
variable "application_environment" { type = string }
# variable "public_subnet1" { type = string }
# variable "public_subnet2" { type = string }
# variable "public_subnet3" { type = string }
# variable "private_subnet1" { type = string }
# variable "private_subnet2" { type = string }
# variable "private_subnet3" { type = string }

# variable "vpc_id" { type = string }

variable "desired_max_size" { type = number }
variable "desired_size" { type = number }
variable "desired_min_size" { type = number }
variable "target_cpu_usage" { type = number }
variable "minimum_scaling_step_size" { type = number }
variable "maximum_scaling_step_size" { type = number }

#ec2
variable "instance_name" {}
variable "instance_type" {}
variable "key_name" {}
variable "ec2_option" {
  type = bool
  default = false
}
