
variable "ami_id" {
  description = "AMI image name that's used for EC2 creation"
  type        = string
}

variable "instance_type" {
  description = "instace type of ec2 to be created"
  type        = string
  default     = "t3.micro"
}

variable "environment" {
  description = "name of the environment for changes"
  type        = string
}
