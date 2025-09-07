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
  region = var.regions
}


resource "aws_instance" "my_instance" {
  ami = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  subnet_id = "subnet-0199b9c200116e62d"
  vpc_security_group_ids = ["sg-0aae95637b0d12fd1"]
  key_name = "MY_KEY"
  count = 2
  tags = {
    Name = "my first_ec2"
  }
}
