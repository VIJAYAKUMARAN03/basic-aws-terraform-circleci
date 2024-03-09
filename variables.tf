variable "region" {
  description = "AWS region"
  type = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI"
  type = string
  default     = "ami-05c13eab67c5d8861"
}

variable "instance_type" {
  description = "instance_type"
  type = string
  default     = "t2.micro"
}

variable "environment" {
  description = "environment"
  type = string
  default     = "not specified"
}
