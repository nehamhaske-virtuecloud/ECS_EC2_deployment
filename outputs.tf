output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the created VPC"
}

output "public_subnet_ids" {
  value       = [for s in aws_subnet.public : s.id]
  description = "IDs of the public subnets"
}

output "private_subnet_ids_app" {
  value       = [for s in aws_subnet.private_app : s.id]
  description = "IDs of app tier private subnets"
}

output "private_subnet_ids_db" {
  value       = [for s in aws_subnet.private_db : s.id]
  description = "IDs of DB private subnets"
}

output "alb_dns_name" {
  value       = aws_lb.ecs_alb.dns_name
  description = "DNS name of the Application Load Balancer"
}

output "rds_endpoint" {
  value       = aws_db_instance.app_db.endpoint
  description = "RDS instance connection endpoint"
}

output "ecs_cluster_name" {
  value       = aws_ecs_cluster.ecs_cluster.name
  description = "ECS Cluster name"
}

output "ecs_app_service_name" {
  value       = aws_ecs_service.app.name
  description = "ECS App Service name"
}

output "ecs_web_service_name" {
  value       = aws_ecs_service.web.name
  description = "ECS Web Service name"
}

output "web_ecr_repo_url" {
  value       = aws_ecr_repository.web.repository_url
  description = "URL of Web ECR Repository"
}

output "app_ecr_repo_url" {
  value       = aws_ecr_repository.app.repository_url
  description = "URL of App ECR Repository"
}

output "web_asg_name" {
  value       = aws_autoscaling_group.web_asg.name
  description = "Name of Web Auto Scaling Group"
}

output "app_asg_name" {
  value       = aws_autoscaling_group.app_asg.name
  description = "Name of App Auto Scaling Group"
}
