variable "name" {
  description = "The name of the Load Balancer"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to attach to the LB"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group for the LB"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}