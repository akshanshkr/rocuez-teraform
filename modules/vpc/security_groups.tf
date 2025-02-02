# Create SG_bastion security group
# Ec2 SG load balancer
resource "aws_security_group" "sg_ec2_lb" {
  vpc_id      = aws_vpc.main.id
  name        = "SG_ec2-lb-${var.env}"
  description = "Public lb security group - ${var.env}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = ""
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = ""
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "SG_ec2-lb-${var.env}"
    Environment = var.env
    Maintainer  = "Terraform"
  }
}

resource "aws_security_group" "sg_ec2" {
  vpc_id      = aws_vpc.main.id
  name        = "SG_ec2-${var.env}"
  description = "Private app ec2 security group - ${var.env}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
   
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "SG_ec2-${var.env}"
    Environment = var.env
    Maintainer  = "Terraform"
  }
}

