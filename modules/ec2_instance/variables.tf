
variable "ami_id" {
  description = "AMI image name that's used for EC2 creation"
  type        = string
}

variable "instance_type" {
  description = "instace type of ec2 to be created"
  type        = string
  default     = "m5.large"
}

variable "environment" {
  description = "name of the environment for changes"
  type        = string
}

variable "security_groups" {
  description = "list of security groups"
  type        = list(string)

}

variable "public_vpc_subnets" {
  description = "public subnets within VPC"
  type = list(string)
  
}

variable "private_vpc_subnets" {
  description = "private subnets within VPC"
  type = list(string)
  
}
