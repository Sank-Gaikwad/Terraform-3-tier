# custom VPC creation
resource "aws_vpc" "custom_vpc" {
  cidr_block = var.cidr_block
  
  tags = {
    Name = "custom_vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "my_igw"
  }
}
# Web Subnet
resource "aws_subnet" "websubnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.web_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "websubnet"
  }
}

# App Subnet
resource "aws_subnet" "appsubnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.app_cidr_block
  availability_zone = "us-east-1b"

  tags = {
    Name = "appsubnet"
  }
}

# DB Subnet
resource "aws_subnet" "dbsubnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.db_cidr_block
  availability_zone = "us-east-1c"

  tags = {
    Name = "dbsubnet"
  }
}
# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "private-rt"
  }
}

# Main RT Association
resource "aws_main_route_table_association" "main_rt_asso" {
  vpc_id         = aws_vpc.custom_vpc.id
  route_table_id = aws_route_table.public_rt.id
}

# Subnet Associations
resource "aws_route_table_association" "web_association" {
  subnet_id      = aws_subnet.websubnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "app_association" {
  subnet_id      = aws_subnet.appsubnet.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "db_association" {
  subnet_id      = aws_subnet.dbsubnet.id
  route_table_id = aws_route_table.private_rt.id
}
# DB Subnet Group
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.appsubnet.id, aws_subnet.dbsubnet.id]

  tags = {
    Name = "My-db-subnet-group"
  }
}
