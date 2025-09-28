provider "aws" {
  region = var.global_vars.aws_region
}

module "web_server" {
  source        = "./modules/ec2_instance"
  ami_id        = var.aws_instance_vars.ami_id
  instance_name = var.aws_instance_vars.instance_name
  environment   = var.aws_instance_vars.environment
}
