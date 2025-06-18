variable "project_name" {
  description = "Project name prefix for tagging"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "neha-3tier"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Availability Zones
variable "availability_zone_1" {
  description = "Primary Availability Zone"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone_2" {
  description


# variable "ami_id" {
# description = "AMI ID for EC2 instances"
# type        = string
# }

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "key_name" {
  description = "Key pair name for EC2 SSH"
  type        = string
}

variable "allowed_ip" {
  description = "Allowed CIDR for SSH and HTTP access"
  type        = string
}

variable "db_username" {
  description = "RDS database username"
  type        = string
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "RDS database name"
  type        = string
}


