
output "provider" {
  value = "${var.provider1}"
}

output "region" {
  value = "${var.region}"
}
output "instance_type" {
  value = "${var.instance_type}"
}
output "environment" {
  value = "${var.environment}"
}

# provider "aws" {
#   region = "us-east-1"
#   access_key = ""
#   secret_key = ""
# }
# resource "aws_instance" "my_first_instance" {
#     ami = var.ami
#     instance_type = var.instance_type
# }

# resource "aws_instance" "my_first_instance" {
#     ami = "ami-0fc5d935ebf8bc3bc"
#     instance_type = "t2.micro"
# }

# resource "aws_vpc" "first_vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "First_VPC"
#   }
# }

# resource "aws_subnet" "subnet-1"{
#   vpc_id = "vpc-0593658918ee930b1"
#   cidr_block = "172.31.0.0/20"
#   tags = {
#     Name = "First_subnet"
#   }
# } 
