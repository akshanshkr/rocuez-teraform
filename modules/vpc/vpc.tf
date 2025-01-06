################ VPC #################
resource "aws_vpc" "main" {
  cidr_block           = var.main_vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "rocuez-${var.env}-vpc"
    Environment = var.env
    Maintainer  = "Terraform"
  }
}
