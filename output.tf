output "region" {
  value = "${var.region}"
}
output "instance_type" {
  value = "${var.instance_type}" 
}
output "environment" {
  value = "${var.environment}"
}
output "ami" {
  value = "${var.ami}"
}
output "availability_zone" {
  value = data.aws_availability_zones.available
}