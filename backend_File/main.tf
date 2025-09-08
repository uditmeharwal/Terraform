terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.54.1"
    }
  }
   backend "s3" {
        bucket = "terraform-data-bucket-8267977123"
        key = "backend.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
