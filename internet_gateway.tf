resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = aws_vpc.wordpress_vpc.id  # Attach the Internet Gateway to the VPC created in the VPC resource
  tags = {
    Name = "WordPress-IGW"  # Tag the Internet Gateway for easy identification in AWS console
  }
}
