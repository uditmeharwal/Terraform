terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = var.region[0]
}

output "s3" {
    value = aws_s3_bucket.bucket.id

}

resource "random_bytes" "byte" {
    length = 8
  
}

resource "aws_s3_bucket" "bucket" {
  bucket = "uditmeharwal-${random_bytes.byte.hex}"

  tags = {
    Name = "bucket"
  }
  
}

# Upload a local file to an existing S3 bucket
resource "aws_s3_object" "file_to_upload" {
  bucket       = aws_s3_bucket.bucket.bucket  # name of the bucket"
  key          = "jaat.txt"     # object name in S3
  source       = "jaat.txt"     # path to your local file
  content_type = "text/plain"

  
}
