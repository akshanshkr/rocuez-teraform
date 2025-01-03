######## IGW ###############
resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "rocuez-${var.env}-igw"
    Environment = var.env
    Maintainer  = "Terraform"
  }
}