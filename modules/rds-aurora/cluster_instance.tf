resource "aws_rds_cluster_instance" "rds_instances" {
  count              = var.nodes
  identifier         = "aurora-node-${terraform.workspace}-${count.index}"
  cluster_identifier = aws_rds_cluster.rds-cluster.id
  engine             = var.engine
  # engine_version     = var.engine_version  
  instance_class       = var.instance_class
  publicly_accessible  = var.pub_access
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  apply_immediately    = var.apply_immediately
  promotion_tier       = 1
  monitoring_interval  = var.monitoring_interval
  monitoring_role_arn  = var.monitoring_interval > 0 ? aws_iam_role.rds_enhanced_monitoring_role.arn : null

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "aurora-node-${terraform.workspace}-${count.index}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}
