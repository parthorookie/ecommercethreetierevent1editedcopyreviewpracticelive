output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "rabbitmq_private_ip" {
  value = module.rabbitmq_ec2.private_ip
}

output "aurora_endpoint" {
  value = module.aurora.cluster_endpoint
}

output "alb_dns_name" {
  value = module.alb_waf.alb_dns_name
}

output "ecr_backend_url" {
  value = module.ecr.backend_repo_url
}

output "ecr_worker_url" {
  value = module.ecr.worker_repo_url
}

output "vpc_id" {
  value = module.vpc.vpc_id
}