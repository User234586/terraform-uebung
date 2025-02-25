resource "aws_vpc" "wordpress_vpc" {
  cidr_block           = var.vpc_cidr_block  # Nimmt den CIDR-Block aus variables.tf
  enable_dns_support   = true  # Ermöglicht DNS-Namensauflösung (wichtig für RDS & ALB)
  enable_dns_hostnames = true  # Ermöglicht Zuweisung von Hostnamen zu Instanzen mit Public IP

  tags = {
    Name = "WordPressVPC"  # Tag für bessere Übersicht in AWS
  }
}
