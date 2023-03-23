variable "region" {
  description = "The region to use for AWS resources"
  type        = string
  default     = "ca-central-1"
}

variable "region_1a" {
  description = "THe region the environment will be installed into"
  type        = string
  default     = "ca-central-1a"
}

variable "vpc_cidr" {
  description = "CIDR range for the vpc created"
  type        = string
  default     = "10.10.0.0/16"
}

variable "private_cidr" {
  description = "CIDR range for the private subnet"
  type        = string
  default     = "10.10.1.0/24"
}


variable "aws_access_key" {
  type      = string
  sensitive = true
}


variable "aws_secret_key" {
  type      = string
  sensitive = true
}
