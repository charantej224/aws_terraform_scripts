provider "aws" {
  region = var.global_vars.aws_region
}

terraform {
  backend "s3" {
    bucket = "terraform-state-us-east1"
    key    = "stage_env"
    region = "us-east-1"
  }
}
