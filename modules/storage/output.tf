# modules/network/outputs.tf
output "efs_id" {
  value = aws_efs_file_system.efs.id
}
