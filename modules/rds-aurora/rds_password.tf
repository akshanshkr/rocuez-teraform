resource "random_password" "master" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_ssm_parameter" "rds_db_password" {
  name  = "/${terraform.workspace}/rds-db-password"
  type  = "SecureString"
  value = random_password.master.result
}

resource "aws_ssm_parameter" "rds_db_username" {
  name  = "/${terraform.workspace}/rds-db-username"
  type  = "SecureString"
  value = var.master_user
}