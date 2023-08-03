################# Subnets #############
resource "aws_subnet" "subnet_pub_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.1.0/24"
  availability_zone = var.availability_zones[0]

  tags = {
    Name        = "app-pub-subnet-1-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}
resource "aws_subnet" "subnet_pub_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.2.0/24"
  availability_zone = var.availability_zones[1]
  tags = {
    Name        = "app-pub-subnet-2-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}

resource "aws_subnet" "subnet_pub_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.3.0/24"
  availability_zone = var.availability_zones[2]
  tags = {
    Name        = "app-pub-subnet-3-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}

resource "aws_subnet" "subnet_pri_app1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.4.0/24"
  availability_zone = var.availability_zones[0]

  tags = {
    Name        = "app-pri-subnet-1-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
    Type        = "private-subnets"
                  "kubernetes.io/role/internal-elb" = 1    
    #               "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"  
                    "kubernetes.io/cluster/var.cluster_name" = "shared"  
  }
}

resource "aws_subnet" "subnet_pri_app2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.5.0/24"
  availability_zone = var.availability_zones[1]
  tags = {
    Name        = "app-pri-subnet-2-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
    Type        = "private-subnets"
                  "kubernetes.io/role/internal-elb" = 1    
    #               "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"  
                  "kubernetes.io/cluster/var.cluster_name" = "shared"  
  }
}
resource "aws_subnet" "subnet_pri_app3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.6.0/24"
  availability_zone = var.availability_zones[2]
  tags = {
    Name        = "app-pri-subnet-3-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
    Type        = "private-subnets"
                  "kubernetes.io/role/internal-elb" = 1    
    #               "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"  
                  "kubernetes.io/cluster/var.cluster_name" = "shared"  
  }
}