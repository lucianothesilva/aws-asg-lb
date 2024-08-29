resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/23"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "lu-vpc"
  }
}

//subnets publicas
resource "aws_subnet" "pub_subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.0/27"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2a"
}

resource "aws_subnet" "pub_subnet_1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.32/27"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2b"
}

//subnet privada
resource "aws_subnet" "priv_subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/27"
  map_public_ip_on_launch = false //isso seta como privada (sem ip publico)
  availability_zone       = "us-east-2b"
}