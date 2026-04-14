# EKS Cluster Name for kubeconfig updates
output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

# RabbitMQ IPs (Private for App, Public for Management UI)
output "rabbitmq_private_ip" {
  description = "Private IP for internal amqp connection"
  value       = module.rabbitmq.private_ip
}

output "rabbitmq_public_ip" {
  description = "Public IP for Management Console access"
  value       = module.rabbitmq.public_ip
}

# RDS / Aurora Endpoint
output "aurora_endpoint" {
  description = "The cluster endpoint for the database"
  value       = module.aurora.cluster_endpoint
}

# Load Balancer DNS for the Final App URL
output "alb_dns_name" {
  description = "DNS name of the application load balancer"
  value       = module.alb.dns_name
}

# ECR Repository URLs for ArgoCD image overrides
output "ecr_backend_url" {
  description = "The URL of the backend ECR repository"
  value       = aws_ecr_repository.backend.repository_url
}

output "ecr_worker_url" {
  description = "The URL of the worker ECR repository"
  value       = aws_ecr_repository.worker.repository_url
}

# VPC ID (Critical for the AWS Load Balancer Controller installation)
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}