output "instance_ip" {
  description = "Thhe public IP address of the Ec2 instances"
  value       = aws_instance.web_server.public_ip
}
