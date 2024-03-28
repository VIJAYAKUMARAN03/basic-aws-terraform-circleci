provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "tf-states-stream" //your tfstate bucket name 
    key    = "vijay/dev.tfstate"
    region = "ap-south-1"
  }
}

# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_VPC"
  }
}

# availability zones
data "aws_availability_zones" "available" {}

# Public subnet
resource "aws_subnet" "subnet-1"{
  vpc_id = aws_vpc.my_vpc.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "my_public_subnet"
  }
} 


# internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-internet-gateway"
  }
}


# Route table
resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name        = "pubrt-route-table"
    environment = "${var.environment}"
  }
}

#Route table association
resource "aws_route_table_association" "public-subnet-route" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.public-route.id
  depends_on = [ aws_route_table.public-route ]
}

# Default Security Group
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.my_vpc.id
}

#Security group for EC2
resource "aws_security_group" "sg-pub" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "security-group"
  description = "Security group that allows HTTPS ingress traffic"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Currently it allow all ips. If you wnat only specific ip include the particular with /32 (ex: 18.24.3.50/32) at the end.
  }

  tags = {
    Name        = "sg-ec2-01"
    environment = "${var.environment}"
  }
}


# EC2 instance
resource "aws_instance" "ec2_instance" {
    ami = var.ami
    instance_type = "${var.instance_type}"
    subnet_id = aws_subnet.subnet-1.id
    vpc_security_group_ids      = [aws_security_group.sg-pub.id]
    tags = {
      Name = "sample_ec2_instance"
      environment = "${var.environment}"
    }
}

# s3 Endpoint
resource "aws_vpc_endpoint" "s3-endpoint" {
  vpc_id            = aws_vpc.my_vpc.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  tags = {
    Name = "my-s3-endpoint"
    environment = "${var.environment}"
  }
}

# S3-bucket
resource "aws_s3_bucket" "prv-s3-01" {
  bucket = "prvs3-bucket"

  tags = {
    Name = "prvs3-bucket"
    environment = "${var.environment}"
  }
}

# s3-bucket route table association
resource "aws_vpc_endpoint_route_table_association" "s3-endpoint-public" {
  route_table_id  = aws_route_table.public-route.id
  vpc_endpoint_id = aws_vpc_endpoint.s3-endpoint.id
}