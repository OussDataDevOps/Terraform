variable "name" {
  description = "The name of the ALB security group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to create the security group in"
  type        = string
}