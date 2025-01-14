terraform {
  backend "s3" {
    bucket         = "rocuez-infra-testing"
    # bucket         = "rocuez-backed-testing"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    # region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "rocuez-backed-db-testing"
    # dynamodb_table = "rocuez-backed-db"

  }
}