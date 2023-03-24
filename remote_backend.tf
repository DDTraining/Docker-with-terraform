terraform {
  backend "s3" {
    bucket = "backendstatebucket"
    key    = "terraform.tfstate"
    region = "ca-central-1"
    encrypt= true
  }
}

