
module "web_server" {
  source        = "./modules/ec2_instance"
  aws_region    = "us-east-1"
  ami_id        = "ami-0b0ea68c435eb488d"
  instance_name = "myweb"
}
