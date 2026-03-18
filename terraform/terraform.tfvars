# ══════════════════════════════════════════════════════════════════════════════
#  terraform/terraform.tfvars
#  DO NOT COMMIT — already in .gitignore
#
#  This file provides values for every variable in terraform/variables.tf
#  for the parthorookie/ecommercethreetierevent1edited repo.
#
#  Two values you MUST change before running terraform plan:
#    1. operator_ip_cidr  →  run: curl ifconfig.me  then paste as "x.x.x.x/32"
#    2. db_password       →  choose a strong password (no @ $ / or spaces)
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

# ── Aurora PostgreSQL password ─────────────────────────────────────────────────
# Rules: min 8 chars, no spaces, no @ $ / characters
db_password = "CHANGE_ME_StrongPass123"

# ── RabbitMQ EC2 ──────────────────────────────────────────────────────────────
rabbitmq_instance_type = "t3.medium"

# Amazon Linux 2023 AMI for ap-south-1
# Verify latest: AWS Console → EC2 → AMIs → search "al2023-ami-2023"
rabbitmq_ami = "ami-0f58b397bc5c1f2e8"

# ── RabbitMQ public access fix ────────────────────────────────────────────────
# This is the key variable added by the Fix Option 1 change.
# It opens port 15672 (RabbitMQ management UI) to YOUR IP only.
#
# Step 1: Run this in your terminal to get your public IP:
#           curl ifconfig.me
# Step 2: Replace YOUR.IP.ADDRESS below with that value
# Step 3: Save this file and run: terraform plan
#
# Example: operator_ip_cidr = "203.0.113.45/32"
# NEVER use "0.0.0.0/0" — that exposes RabbitMQ to the entire internet
operator_ip_cidr = "YOUR.IP.ADDRESS/32"

# ── EKS cluster ───────────────────────────────────────────────────────────────
eks_node_instance_types = ["t3.medium"]
eks_desired_size        = 2
eks_min_size            = 1
eks_max_size            = 5
