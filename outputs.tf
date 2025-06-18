output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_subnet_ids_app" {
  value = [for s in aws_subnet.private_app : s.id]
}


output "web_instance_public_ip" {
  description = "Public IP of the Web EC2 instance"
  value       = aws_instance.nginx_proxy.public_ip

}

output "app_instance_private_ip" {
  description = "Private IP of the App EC2 instance"
  value       = aws_instance.app_instance.private_ip

}

output "alb_dns" {
  description = "ALB DNS Name"
  value       = aws_lb.alb.dns_name
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.db.endpoint
}

