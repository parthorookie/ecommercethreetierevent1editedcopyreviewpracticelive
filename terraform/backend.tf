terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "ecommerce-terraform-state-prod-partho-001"
    key          = "terraform.tfstate"
    region       = "ap-southeast-1"
    encrypt      = true
    use_lockfile = true
  }
}