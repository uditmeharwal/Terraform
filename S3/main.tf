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

# Upload a local file to an existing S3 bucket
resource "aws_s3_object" "file_to_upload" {
  bucket       = "uditmeharwal-terraform-bucket"
  key          = "jaat.txt"     # object name in S3
  source       = "jaat.txt"     # path to your local file
  content_type = "text/plain"

  # Helps Terraform detect changes to the local file and re-upload
  etag = filemd5("jaat.txt")
}
