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
  region = var.regions[1]
}

resource "aws_vpc" "MY_VPC" {
    cidr_block = "10.0.0.0/16"

    tags ={
        Name= "MY_VPC"
    }
    
}
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.MY_VPC.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true

    tags = {
        NAME = "public_subnet"
    }
  
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.MY_VPC.id
    cidr_block = "10.0.1.0/24"
    tags = {
        NAME = "private_subnet"

    }
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.MY_VPC.id
    tags = {
        Name = "MY_IGW"
    }
  
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.MY_VPC.id
    route {
       cidr_block = "0.0.0.0/0"
         gateway_id = aws_internet_gateway.igw.id

    }
}

resource  "aws_route_table_association" "a" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.rt.id
}


