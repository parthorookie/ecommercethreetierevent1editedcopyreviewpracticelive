# ══════════════════════════════════════════════════════════════════════════════
# terraform/terraform.tfvars
# DO NOT COMMIT — already in .gitignore
# ══════════════════════════════════════════════════════════════════════════════

# ── Region + project ──────────────────────────────────────────────────────────
region       = "ap-south-1"
project_name = "ecommerce"
environment  = "prod"

# ── VPC networking ────────────────────────────────────────────────────────────
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["ap-south-1a", "ap-south-1b"]



# ── RabbitMQ EC2 ──────────────────────────────────────────────────────────────
rabbitmq_instance_type = "t3.medium"

# Amazon Linux 2023 AMI for ap-south-1
rabbitmq_ami = "ami-0f58b397bc5c1f2e8"

# IMPORTANT: must match GitHub secret RABBITMQ_PASSWORD
rabbitmq_password = "CHANGE_ME_RabbitMQ_Pass123"



# ── EKS cluster ───────────────────────────────────────────────────────────────
eks_node_instance_types = ["t3.medium"]
eks_desired_size        = 2
eks_min_size            = 1
eks_max_size            = 5

# ─────────────────────────────────────────────────────────────────────────────
# ECS FARGATE WORKER (NEW)
# ─────────────────────────────────────────────────────────────────────────────

# CPU (valid: 256, 512, 1024, 2048)
worker_cpu = 512

# Memory in MB (must match CPU constraints)
# 512 CPU → 1024, 2048, 3072, 4096 allowed
worker_memory = 1024

# Number of worker tasks (baseline scaling)
worker_desired_count = 2

# Future autoscaling config (not active yet)
worker_min_count = 1
worker_max_count = 5