variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to create the security group in"
  type        = string
}

variable "alb_sg_id" {
  description = "The Security Group ID of the ALB"
  type        = string
}