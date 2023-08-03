terraform {
  backend "s3" {
    bucket         = "teracar-terraform-backend"
    key            = "terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "teracar-terraform-table"
  }
}