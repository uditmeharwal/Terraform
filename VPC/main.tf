terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

provider "aws" {
  region = var.regions[1]
}

resource "aws_vpc" "MY_VPC_TERRAFORM"{
 cidr_block = "10.0.0.0/16"
 tags={
    NAME = "MY_VPC_TERRAFORM"
 }
}
resource "aws_subnet" "Public_subnet" {
    cidr_block = "10.0.0.0/24"
    vpc_id =aws_vpc.MY_VPC_TERRAFORM.id
    map_public_ip_on_launch = true
    tags={
        NAME = "Public_subnet"
    }
 }
resource "aws_subnet" "Private_Subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id =aws_vpc.MY_VPC_TERRAFORM.id
    tags={
        NAME = "Private_Subnet"
    }

}
resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.MY_VPC_TERRAFORM.id
    tags={
        NAME = "IGW"
    }
}
resource "aws_route_table" "Public_Route_Table" {
    vpc_id = aws_vpc.MY_VPC_TERRAFORM.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }
}

resource "aws_route_table_association" "Public_Route_Table_Association" {
    subnet_id = aws_subnet.Public_subnet.id
    route_table_id = aws_route_table.Public_Route_Table.id
}