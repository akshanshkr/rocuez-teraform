###### outputs ######
output "vpc_id" {
  value = aws_vpc.main.id
}

# subnets
output "subnet_pub_app1" {
  value = aws_subnet.subnet_pub_1.id
}

output "subnet_pub_app2" {
  value = aws_subnet.subnet_pub_2.id
}

output "subnet_pub_app3" {
  value = aws_subnet.subnet_pub_3.id
}

output "subnet_pri_app1" {
  value = aws_subnet.subnet_pri_app1.id
}

output "subnet_pri_app2" {
  value = aws_subnet.subnet_pri_app2.id
}

output "subnet_pri_app3" {
  value = aws_subnet.subnet_pri_app3.id
}


# security groups
output "sg_bastion" {
  value = aws_security_group.sg_bastion.id
}

output "sg_bastion_name" {
  value = aws_security_group.sg_bastion.name
}

output "sg_ec2_lb" {
  value = aws_security_group.sg_ec2_lb.id
}

output "sg_ec2" {
  value = aws_security_group.sg_ec2.id
}

output "sg_ec2_name" {
  value = aws_security_group.sg_ec2.name
}

output "sg_rds" {
  value = aws_security_group.sg_rds.id
}