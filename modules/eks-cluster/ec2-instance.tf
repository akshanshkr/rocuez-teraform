# EC2 Instance
resource "aws_instance" "bastion_ec2" {
  ami                    = data.aws_ami.ubuntu22.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  monitoring             = false
  subnet_id              = var.public_subnets[0]
  vpc_security_group_ids = [var.bastion_sg_id, var.ec2_instance_sg_id]
  tags = {
    Name        = "advskill-${terraform.workspace}-bastion_ec2"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}