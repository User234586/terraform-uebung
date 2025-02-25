terraform {
  cloud {
    organization = "PersonalOrga"  # Deine Terraform Cloud Organisation
    workspaces {
      name = "terraform-uebung"  # Name des Terraform Cloud Workspaces
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.AWS_REGION
}
