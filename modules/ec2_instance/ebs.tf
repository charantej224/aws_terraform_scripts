resource "aws_ebs_volume" "ebs_zone1a" {
  availability_zone = "us-east-1a"
  size = 10
  type = "gp2"
  tags = {
    Name = "ebs_zone1a"
  }
}

resource "aws_ebs_volume" "ebs_zone1b" {
  availability_zone = "us-east-1b"
  size = 10
  type = "gp2"
  tags = {
    Name = "ebs_zone1b"
  }
}

resource "aws_volume_attachment" "data_attach_1a" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs_zone1a.id
  instance_id = aws_instance.web_server_az1.id
}

resource "aws_volume_attachment" "data_attach_1b" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs_zone1b.id
  instance_id = aws_instance.web_server_az2.id
}