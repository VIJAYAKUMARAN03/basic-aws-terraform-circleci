variable "provider1" {
  description = "Provider"
  type = string
  default     = "aws"
}
variable "region" {
  description = "AWS region"
  type = string
  default     = "not specified"
}
variable "instance_type" {
  description = "instance_type"
  type = string
  default     = "not specified"
}
variable "environment" {
  description = "environment"
  type = string
  default     = "not specified"
}

variable "check_environment" {
  description = "check_environment"
  type = string
  default     = "not specified"
}