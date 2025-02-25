variable "AWS_REGION" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  default     = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1"
  default     = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  default     = "10.0.4.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "db_username" {
  description = "RDS Master Username"
  sensitive   = true
}

variable "db_password" {
  description = "RDS Master Password"
  sensitive   = true
}

variable "amis" {
  type        = map(string)
  description = "Region specific AMI"
  default = {
    us-west-2    = "ami-000089c8d02060104"
    eu-central-1 = "ami-0ec8c354f85e48227"
  }
}
