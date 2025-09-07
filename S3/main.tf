terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

provider "aws" {
  region = var.region[0]
}

output "s3" {
    value = aws_s3_bucket.bucket.id

}

resource "aws_s3_bucket" "bucket" {
  bucket = "uditmeharwal-terraform-bucket"

  tags = {
    Name        = "uditmeharwal-terraform_bucket"
  }
  
}