terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "partho-253490759114-ap-south-1-an"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}