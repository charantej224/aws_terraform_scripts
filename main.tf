


module "vpc" {
  source      = "./modules/vpc"
  environment = var.aws_instance_vars.environment
}

module "sg" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}


module "ec2" {
  source              = "./modules/ec2_instance"
  ami_id              = var.aws_instance_vars.ami_id
  environment         = var.aws_instance_vars.environment
  security_groups     = module.sg.security_groups
  public_vpc_subnets  = module.vpc.public_vpc_subnets
  private_vpc_subnets = module.vpc.private_vpc_subnets
}


