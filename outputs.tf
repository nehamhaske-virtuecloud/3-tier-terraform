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
  description = "IDs of the private subnets for the app tier"
  value       = [for s in aws_subnet.app_private : s.id]
}

output "private_subnet_ids_db" {
  description = "IDs of the private subnets for the DB tier"
  value       = [for s in aws_subnet.db_private : s.id]
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
  description = "RDS database endpoint"
  value       = aws_db_instance.mysql_db.endpoint
  sensitive   = true
}

output "rds_username" {
  description = "RDS database master username"
  value       = var.db_username
  sensitive   = true
}
