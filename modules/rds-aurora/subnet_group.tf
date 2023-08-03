resource "aws_db_subnet_group" "db_subnet" {
  name       = "aurora_db_subnet-${terraform.workspace}"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name        = "aurora_db_subnet-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}
