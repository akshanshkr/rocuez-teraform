terraform {
  backend "s3" {
    bucket         = "rocuez-backed-testing"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "rocuez-backed-db"
  }
}