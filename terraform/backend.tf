terraform {
  required_version = ">= 1.10.0"   # Important: use_lockfile requires Terraform 1.10+

  backend "s3" {
    bucket       = "ecommerce-terraform-state-prod1"
    key          = "prod/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}