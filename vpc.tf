# VPC erstellen
resource "aws_vpc" "dev_vpc" {
  cidr_block           = "10.0.0.0/16"  
  enable_dns_hostnames = true 
  enable_dns_support   = true
  
  tags = {
    Name = "deham9"
  }       
}

# Öffentliches Subnet 1
resource "aws_subnet" "public-1" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true # Automatische Zuweisung öffentlicher IPs

  tags = {
    Name = "deham9-public-1"
  }
}

# Privates Subnet 1
resource "aws_subnet" "private-1" {
  vpc_id            = aws_vpc.dev_vpc.id 
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "deham9-private-1"
  }
}

# Öffentliches Subnet 2
resource "aws_subnet" "public-2" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "deham9-public-2"
  }
}

# Privates Subnet 2
resource "aws_subnet" "private-2" {
  vpc_id            = aws_vpc.dev_vpc.id 
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "deham10-private-2"
  }
}

# Internet Gateway erstellen (nur für Public Subnets)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "deham10-igw"
  }
}

# Route Table für Public Subnets (mit Internetzugang)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "deham10-public-rt"
  }
}

# Route Table für Private Subnets (kein Internetzugang)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "deham10-private-rt"
  }
}

# Route Table Assoziationen
resource "aws_route_table_association" "public_1_association" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public-1.id
}

resource "aws_route_table_association" "public_2_association" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public-2.id
}

resource "aws_route_table_association" "private_1_association" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private-1.id
}

resource "aws_route_table_association" "private_2_association" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private-2.id
}

# Kostenlose Security Group erstellen
resource "aws_security_group" "sg_dev" {
  name_prefix = "dev-sg-"
  vpc_id      = aws_vpc.dev_vpc.id

  # Beispiel für eine Regel, die eingehenden HTTP-Verkehr erlaubt
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  tags = {
    Name = "dev-sg"
  }
}
