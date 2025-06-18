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

variable "availability_zone_1" {
  description = "Primary Availability Zone"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone_2" {
  description = "Secondary Availability Zone"
  type        = string
  default     = "ap-south-1b"
}

# Public Subnets
variable "public_subnet_cidr_1" {
  description = "CIDR block for Public Subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for Public Subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

# Private Subnets
variable "private_subnet_cidr_1" {
  description = "CIDR block for Private Subnet 1"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for Private Subnet 2"
  type        = string
  default     = "10.0.4.0/24"
}

# Instance Type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# SSH Key
variable "key_name" {
  description = "Key pair name to access EC2"
  type        = string
  default     = "my-new-key"
}

# CIDR for SSH Access
variable "allowed_ip" {
  description = "Your IP address to SSH into the EC2 instance"
  type        = string
  default     = "0.0.0.0/0"
}

# RDS Configuration
variable "db_username" {
  description = "Username for RDS DB"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for RDS DB"
  type        = string
  default     = "password123!"
}

variable "db_name" {
  description = "Database name for RDS"
  type        = string
  default     = "mydb"
}
