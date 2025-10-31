
resource "random_pet" "name" {}

resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key" {
  content         = tls_private_key.ec2_key.private_key_pem
  filename        = "ec2-key-${random_pet.name.id}.pem"
  file_permission = "0600"
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ec2-key-${random_pet.name.id}"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "aws_instance" "web_server_az1" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.public_vpc_subnets[0]
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = var.security_groups
  #placement_group = aws_placement_group.ec2_pg_cluster.name
  #count           = 2

  user_data = templatefile("${path.module}/user_data.tftpl", {
    ec2_name = "EC2-AZ1-${random_pet.name.id}"
    efs_id = var.var_efs_id
  })
  
  tags = {
    Name        = "EC2-AZ1-${random_pet.name.id}"
    Environment = var.environment
  }
}

resource "aws_instance" "web_server_az2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.public_vpc_subnets[1]
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = var.security_groups
  #placement_group = aws_placement_group.ec2_pg_cluster.name
  #count           = 2

  user_data = templatefile("${path.module}/user_data.tftpl", {
    ec2_name = "EC2-AZ2-${random_pet.name.id}"
    efs_id = var.var_efs_id
  })

  tags = {
    Name        = "EC2-AZ2-${random_pet.name.id}"
    Environment = var.environment
  }
}
