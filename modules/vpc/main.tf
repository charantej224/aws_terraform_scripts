# VPC definition.
resource "aws_vpc" "thotas_vpc" {

  cidr_block           = var.vpc_subnet
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "thotas_vpc"
    Environment = var.environment
  }
}

# public zone1a
resource "aws_subnet" "public_zone1a" {
    vpc_id = aws_vpc.thotas_vpc.id
    cidr_block = "10.0.1.0/25"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
    Name = "public-subnet"
    Environment = var.environment
  }
}

# private zone1a
resource "aws_subnet" "private_zone1a" {
    vpc_id = aws_vpc.thotas_vpc.id
    cidr_block = "10.0.1.128/25"
    availability_zone = "us-east-1a"

    tags = {
    Name = "private-subnet"
    Environment = var.environment
  }
}

# public zone1b
resource "aws_subnet" "public_zone1b" {
    vpc_id = aws_vpc.thotas_vpc.id
    cidr_block = "10.0.2.0/25"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true
    tags = {
    Name = "public-subnet"
    Environment = var.environment
  }
}

# private zone1b
resource "aws_subnet" "private_zone1b" {
    vpc_id = aws_vpc.thotas_vpc.id
    cidr_block = "10.0.2.128/25"
    availability_zone = "us-east-1b"

    tags = {
    Name = "private-subnet"
    Environment = var.environment
  }
}

# Internet Gateway
resource "aws_internet_gateway" "thotas_igw" {
  vpc_id = aws_vpc.thotas_vpc.id

  tags = {
    Name = "thotas-vpc-igw"
    Environment = var.environment
  }
}

# Public route tables
resource "aws_route_table" "thotas_public_routes" {
  vpc_id = aws_vpc.thotas_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.thotas_igw.id
  }

  tags = {
    Name = "thotas-public-route-table"
  }
}


# Associate Public Subnet with Route Table
resource "aws_route_table_association" "az_1a_route" {
  subnet_id      = aws_subnet.public_zone1a.id
  route_table_id = aws_route_table.thotas_public_routes.id
}

resource "aws_route_table_association" "az_1b_route" {
  subnet_id      = aws_subnet.public_zone1b.id
  route_table_id = aws_route_table.thotas_public_routes.id
}