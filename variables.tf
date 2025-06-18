variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidr_app" {
  description = "List of private subnet CIDRs for the app tier"
  type        = list(string)
}

variable "private_subnet_cidr_db" {
  description = "List of private subnet CIDRs for the db tier"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "EC2 Key Pair name"
}

variable "allowed_ip" {
  type        = string
  description = "Allowed IP for inbound access"
}

variable "db_username" {
  type        = string
  description = "Username for the RDS database"
}

variable "db_password" {
  type        = string
  description = "Password for the RDS database"
}

variable "db_name" {
  type        = string
  description = "Name of the RDS database"
}
