
# EFS File System
resource "aws_efs_file_system" "efs" {

  creation_token   = "multi-az-efs"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
}

resource "aws_efs_mount_target" "efs_mnt_public_zone1a" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.var_public_vpc_subnets[0]
  security_groups = var.var_security_sg_efs

}

resource "aws_efs_mount_target" "efs_mnt_public_zone1b" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.var_public_vpc_subnets[1]
  security_groups = var.var_security_sg_efs

}
