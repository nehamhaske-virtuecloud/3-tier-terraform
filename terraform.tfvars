# VPC variables
vpc_cidr_block         = "10.0.0.0/16"
public_subnet_cidr     = "10.0.1.0/24"
private_subnet_cidr    = "10.0.2.0/24"
availability_zone      = "ap-south-1a"

# EC2 variables
instance_type          = "t2.micro"
key_name               = "my-new-key"
ami_id                 = "ami-0f5ee92e2d63afc18"  # Ubuntu 24.04 in ap-south-1 (Mumbai)

# Application/Environment
environment_name       = "dev"
project_name           = "3-tier-app"

# Security Group rules
allowed_ip             = "0.0.0.0/0"  # Consider narrowing for production

# RDS variables
db_instance_class      = "db.t3.micro"
db_allocated_storage   = 20
db_engine              = "mysql"
db_engine_version      = "8.0"
db_name                = "sampledb"
db_username            = "admin"
db_password            = "password123!"
db_backup_retention    = 7
db_multi_az            = false
db_port                = 3306

# Tags (Optional but useful)
tags = {
  Owner       = "Neha Mhaske"
  Environment = "dev"
  Project     = "3-tier-terraform"
}
