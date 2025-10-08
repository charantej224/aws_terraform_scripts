variable "aws_instance_vars" {
    description = "maps of values required for ec2 instances"
    type = map(string)
}

variable "global_vars" {
    description = "global definitions"
    type = map(string)
}
