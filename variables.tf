variable "region" {
  description = "AWS region"
  type = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI"
  type = string
  default     = "ami-0fc5d935ebf8bc3bc"
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

variable "access_key" {
  description = "access_key"
  type = string
  default     = "not specified"
}

variable "secret_key" {
  description = "secret_key"
  type = string
  default     = "not specified"
}