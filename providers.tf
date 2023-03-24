terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.59.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.20.0"
    }
  }
}

provider "docker" {
  # Configuration options
}


provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
