project_name         = "neha-3tier"
vpc_cidr_block       = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidr  = "10.0.2.0/24"
availability_zone    = "ap-south-1a"

# ami_id               = "ami-0f58b397bc5c1f2e8"  # Ubuntu 24.04 LTS (update if needed)
instance_type        = "t2.micro"
key_name             = "my-new-key"

allowed_ip           = "0.0.0.0/0"

db_username          = "admin"
db_password          = "password123!"
db_name              = "sampledb"

