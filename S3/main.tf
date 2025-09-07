terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
output "s3" {
    value = aws_s3_bucket.bucket.id

}

resource "aws_s3_bucket" "bucket" {
  bucket = "uditmeharwal-terraform_bucket8267977123"

  tags = {
    Name        = "uditmeharwal-terraform_bucket"
  }
  
}