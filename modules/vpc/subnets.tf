################# Subnets #############
resource "aws_subnet" "subnet_pub_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.1.0/24"
  availability_zone = var.availability_zones[0]

  tags = {
    Name        = "app-pub-subnet-1-${var.env}"
    Environment = var.env
    Maintainer  = "Terraform"
    "kubernetes.io/role/elb" = "1"
  }
}
resource "aws_subnet" "subnet_pub_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.2.0/24"
  availability_zone = var.availability_zones[1]
  tags = {
    Name        = "app-pub-subnet-2-${var.env}"
    Environment = var.env
    Maintainer  = "Terraform"
    "kubernetes.io/role/elb" = "1"
  }
}



resource "aws_subnet" "subnet_pri_app1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.4.0/24"
  availability_zone = var.availability_zones[0]

  tags = {
    Name        = "app-pri-subnet-1-${var.env}"
    Environment = var.env
    Maintainer  = "Terraform"
    Type        = "private-subnets"
                  "kubernetes.io/role/internal-elb" = 1     
                    "kubernetes.io/cluster/var.cluster_name" = "shared"  
  }
}

resource "aws_subnet" "subnet_pri_app2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.5.0/24"
  availability_zone = var.availability_zones[1]
  tags = {
    Name        = "app-pri-subnet-2-${var.env}"
    Environment = var.env
    Maintainer  = "Terraform"
    Type        = "private-subnets"
                  "kubernetes.io/role/internal-elb" = 1     
                  "kubernetes.io/cluster/var.cluster_name" = "shared"  
  }
}
