resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id  # Associate the route table with the VPC
  tags = {
    Name = "Public-RT"  # Tag the route table for identification
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id  # Use the ID of the public route table
  destination_cidr_block = "0.0.0.0/0"  # Destination for all outbound traffic (Internet)
  gateway_id             = aws_internet_gateway.wordpress_igw.id  # Use the ID of the internet gateway to route traffic
}



resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id  # Subnet 1 association
  route_table_id = aws_route_table.public_route_table.id  # Public route table association
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id  # Subnet 2 association
  route_table_id = aws_route_table.public_route_table.id  # Public route table association
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id  # Associate the route table with the VPC
  tags = {
    Name = "Private-RT"  # Tag the private route table for identification
  }
}

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id  # Subnet 1 association
  route_table_id = aws_route_table.private_route_table.id  # Private route table association
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id  # Subnet 2 association
  route_table_id = aws_route_table.private_route_table.id  # Private route table association
}
