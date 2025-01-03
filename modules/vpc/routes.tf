############# Route Tables ##########
resource "aws_route_table" "main-public-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }

  tags = {
    Name        = "main-public-rt"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}

resource "aws_route_table" "main-private-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main-natgw.id
  }

  tags = {
    Name        = "main-private-rt"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}

######### PUBLIC Subnet assiosation with route table  ######
resource "aws_route_table_association" "public-assoc-1" {
  subnet_id      = aws_subnet.subnet_pub_1.id
  route_table_id = aws_route_table.main-public-rt.id
}
resource "aws_route_table_association" "public-assoc-2" {
  subnet_id      = aws_subnet.subnet_pub_2.id
  route_table_id = aws_route_table.main-public-rt.id
}

###### PRIVATE Subnets assiosation with rotute table ######
resource "aws_route_table_association" "private-assoc-1" {
  subnet_id      = aws_subnet.subnet_pri_app1.id
  route_table_id = aws_route_table.main-private-rt.id
}
resource "aws_route_table_association" "private-assoc-2" {
  subnet_id      = aws_subnet.subnet_pri_app2.id
  route_table_id = aws_route_table.main-private-rt.id
}
