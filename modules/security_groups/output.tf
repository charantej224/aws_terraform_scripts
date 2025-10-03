output "security_groups" {
  value = [aws_security_group.op_internet_sg.id]
}