resource "aws_eip" "bastion_eip" {
  depends_on = [aws_instance.bastion_ec2]
  instance   = aws_instance.bastion_ec2.id
  domain     = "vpc"
  tags = {
    Name        = "advskill-${terraform.workspace}-bastion_eip"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}