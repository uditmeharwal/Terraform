terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.76.1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

locals {
  users_data = yamldecode(file("./users.yaml")).users

}

output "print_users" {
    value =local.users_data[*].username
                            
}

resource "aws_iam_user" "name" {
 for_each = local.users_data
  name =
} 