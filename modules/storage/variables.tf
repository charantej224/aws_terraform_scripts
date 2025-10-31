variable "var_public_vpc_subnets" {
  description = "public subnet values"
  type        = list(string)
}

variable "var_private_vpc_subnets" {
  description = "private subnet values"
  type        = list(string)
}

variable "var_security_sg_efs" {
  description = "efs security group values"
  type        = list(string)
}
