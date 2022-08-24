variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "fish" {
  type        = string
  description = "(optional) describe your variable"
  default     = "vpc"
}

variable "env" {
  description = "network environment"
  default     = "Dev"
}

variable "public_cidr" {
  default = "10.0.6.0/24"
}

variable "private_cidr" {
  default = "10.0.7.0/24"
}
