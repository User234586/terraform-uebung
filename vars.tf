variable "AWS_REGION" { 
  default     = "us-west-2"
  description = "AWS Region"
}

variable "AMIs" {
  type        = map(string)
  description = "Region specific AMI"
  default = {
    us-west-2     = "ami-0230bd60aa48260c6"
    eu-central-1  = "ami-0ec8c354f85e48227"
  }
}
