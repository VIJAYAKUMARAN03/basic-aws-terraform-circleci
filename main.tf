provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "tf-rp-states" //your tfstate bucket name 
    key    = "dev.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_instance" "first_instance" {
    ami = "ami-05c13eab67c5d8861"
    instance_type = "${var.instance_type}"
    subnet_id = "subnet-057a3368013cab5fb"
    tags = {
      "Name" = "vijay_instance_"
    }
}

resource "aws_instance" "my_first_instance" {
    ami = "ami-0fc5d935ebf8bc3bc" 
    instance_type = "t2.micro"
}

resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "First_VPC"
  }
}

resource "aws_subnet" "subnet-1"{
  vpc_id = "vpc-0593658918ee930b1"
  cidr_block = "172.31.0.0/20"
  tags = {
    Name = "First_subnet"
  }
} 
