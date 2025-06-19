region               =  "ap-south-1"
project_name         = "neha-3tier"
application_environment = "dev"
vpc_cidr_block       = "10.0.0.0/16"

public_subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr_app  = ["10.0.3.0/24", "10.0.4.0/24"]
private_subnet_cidr_db   = ["10.0.5.0/24", "10.0.6.0/24"]

availability_zones   = ["ap-south-1a", "ap-south-1b"]

#ec2 for web-tier
instance_name        = "web-app"
instance_type        = "t2.micro"
key_name             = "my-key-pair"

#ec2 for app-tier
instance_name        = "springboot-app"
instance_type        = "t2.micro"
key_name             = "my-key-pair"

db_username          = "admin"
db_password          = "password123!"
db_name              = "sampledb"
