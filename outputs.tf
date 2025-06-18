# ------------------------
# VPC & Networking Outputs
# ------------------------

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = [for s in aws_subnet.public : s.id]
}

output "private_subnet_ids_app" {
  value = [for s in aws_subnet.private_app : s.id]
}
output "private_subnet_ids_db" {
  value = [for s in aws_subnet.private_db : s.id]
}


# ------------------------
# EC2 & ALB Outputs
# ------------------------

output "web_instance_public_ips" {
  description = "Public IPs of the web-tier EC2 instances (Nginx reverse proxies)"
  value       = [for instance in aws_instance.web_instance : instance.public_ip]
}

output "web_instance_ids" {
  description = "IDs of the web-tier EC2 instances"
  value       = [for instance in aws_instance.web_instance : instance.id]
}

output "app_instance_private_ips" {
  description = "Private IPs of the app-tier EC2 instances"
  value       = [for instance in aws_instance.app_instance : instance.private_ip]
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

# ------------------------
# RDS Output
# ------------------------

output "rds_endpoint" {
  value = aws_db_instance.db.endpoint
}


output "rds_username" {
  description = "RDS database master username"
  value       = var.db_username
  sensitive   = true
}
