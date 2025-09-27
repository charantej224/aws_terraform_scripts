variable "aws_region" {
  description = "AWS region to deploy in"
  type        = string
}

variable "ami_id" {
  description = "AMI image name that's used for EC2 creation"
  type        = string
}

variable "instance_type" {
  description = "instace type of ec2 to be created"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "name of the instances to be created"
  type        = string
}
