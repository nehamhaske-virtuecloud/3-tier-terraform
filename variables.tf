variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_app_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_db_subnet_cidrs" {
  default = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1" # Mumbai (change if needed)
}
