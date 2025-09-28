variable "vpc_subnet" {
  description = "CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
}

variable "environment" {
  description = "name of the environment for changes"
  type        = string
}



