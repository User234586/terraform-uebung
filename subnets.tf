resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.wordpress_vpc.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.wordpress_vpc.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.wordpress_vpc.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = "us-west-2a"
  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.wordpress_vpc.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = "us-west-2b"
  tags = {
    Name = "Private-Subnet-2"
  }
}
