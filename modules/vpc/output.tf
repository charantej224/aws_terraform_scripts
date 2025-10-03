# modules/network/outputs.tf
output "vpc_id" {
  value = aws_vpc.thotas_vpc.id
}

output "public_vpc_subnets" {
  value = [aws_subnet.public_zone1a.id,
  aws_subnet.public_zone1b.id]
}

output "private_vpc_subnets" {
  value = [aws_subnet.private_zone1a.id,
  aws_subnet.private_zone1b.id]
}
