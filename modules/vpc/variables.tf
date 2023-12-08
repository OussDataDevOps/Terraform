variable "aws_region" {
  description = "The AWS region"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "cidr_block_route_table" {
  description = "The CIDR block of the route"
  type        = string
}

variable "vpc_endpoint_type" {
  description = "The VPC endpoint type"
  type        = string
}

variable "vpc_endpoint_type_s3" {
  description = "The VPC endpoint type for S3"
  type        = string
}

variable "tag_vpc" {
  description = "The tag for the VPC"
  type        = string
}

variable "tag_vpc_public_subnet" {
  description = "The tag for the public subnet of VPC"
  type        = string
}

variable "tag_vpc_private_subnet" {
  description = "The tag for the private subnet of VPC"
  type        = string
}

variable "tag_vpc_igw" {
  description = "The tag for the internet gateway"
  type        = string
}

variable "tag_vpc_route_table" {
  description = "The tag for the route table"
  type        = string
}

variable "vpc_endpoint_ec2_ssm" {
  description = "The tag for the endpoint ec2 ssm"
  type        = string
}

variable "vpc_endpoint_ec2_ssm_messages" {
  description = "The tag for the endpoint ec2 ssm messages"
  type        = string
}

variable "vpc_endpoint_ec2_messages" {
  description = "The tag for the endpoint ec2 messages"
  type        = string
}

variable "vpc_endpoint_s3" {
  description = "The tag for the endpoint S3"
  type        = string
}

variable "endpoint_sg" {
  description = "The tag for the endpoint security groupe"
  type        = string
}