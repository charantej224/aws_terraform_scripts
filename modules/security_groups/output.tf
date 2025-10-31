output "ec2_security_groups" {
  value = [aws_security_group.ec2_sg.id]
}

output "efs_security_groups" {
  value = [aws_security_group.efs_sg.id]
}
