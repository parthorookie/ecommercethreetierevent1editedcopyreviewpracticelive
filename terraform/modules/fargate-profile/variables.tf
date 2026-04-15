variable "project_name" {
  description = "Project name"
}

variable "environment" {
  description = "Environment (dev/prod)"
}

variable "aws_region" {
  description = "AWS region"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "private_subnet_ids" {
  description = "Private subnets for ECS tasks"
  type        = list(string)
}

variable "worker_image" {
  description = "ECR image URL for worker"
}

variable "worker_cpu" {
  description = "CPU units (e.g. 256, 512)"
  default     = 512
}

variable "worker_memory" {
  description = "Memory in MB"
  default     = 1024
}

variable "worker_desired_count" {
  description = "Number of worker tasks"
  default     = 2
}

variable "rabbitmq_url" {
  description = "RabbitMQ connection string"
  sensitive   = true
}

variable "db_host" {
  description = "Database endpoint"
}
