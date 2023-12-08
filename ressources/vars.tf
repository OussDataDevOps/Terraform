variable "resources_prefix" {
  type        = string
  default     = "tada"
}

variable "env" {
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "access_key" {
  description = "access_key"
  type        = string
}

variable "secret_key" {
  description = "secret_key"
  type        = string
}
