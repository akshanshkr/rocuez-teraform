resource "aws_rds_cluster" "rds-cluster" {
  cluster_identifier      = "aurora-cluster-${terraform.workspace}"
  engine                  = var.engine
  availability_zones      = [var.availability_zones[0], var.availability_zones[1], var.availability_zones[2]]
  engine_version          = var.engine_version
  database_name           = var.db_name
  master_username         = var.master_user
  master_password         = aws_ssm_parameter.rds_db_password.value
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  db_subnet_group_name    = aws_db_subnet_group.db_subnet.name
  apply_immediately       = var.apply_immediately

  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports

  copy_tags_to_snapshot     = true
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = "aurora-cluster-snapshot-${terraform.workspace}"
  vpc_security_group_ids    = [var.sg_rds]

  storage_encrypted = true
  kms_key_id        = data.aws_kms_alias.rds_kms_key.target_key_arn

  tags = {
    Name        = "aurora-cluster-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }

  lifecycle {
    create_before_destroy = false
    ignore_changes = [
      availability_zones, global_cluster_identifier, engine_version
    ]
  }

}

data "aws_kms_alias" "rds_kms_key" {
  name = "alias/aws/rds"
}