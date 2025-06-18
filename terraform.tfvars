region                  = "ap-south-1"
project_name            = "3-tier-app"
application_environment = "dev"
# vpc_id                  = "vpc-0c9e44e80f6c0d01d"
# private_subnet1         = "ztronix-subnet-private1-us-east-1a"
# private_subnet2         = "ztronix-subnet-private2-us-east-1b"
# private_subnet3         = ""
# public_subnet1          = "ztronix-subnet-public1-us-east-1a"
# public_subnet2          = "ztronix-subnet-public2-us-east-1b"
# public_subnet3          = ""

# EC2 variables
instance_type          = "t2.micro"
key_name               = "my-key-pair"
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
