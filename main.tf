module "vpc" {
  source = "./modules/vpc"
  availability_zones = var.availability_zones
  main_vpc_cidr      = var.main_vpc_cidr
  main_vpc_class_b   = var.main_vpc_class_b
}

# module "cognito" {
#   source = "./modules/cognito"

#   sms_config_external_id          = var.sms_config_external_id
#   region                          = var.aws_region
#   email_config_email_sending_acc  = var.email_config_email_sending_acc
#   email_config_ses_source_arn     = var.email_config_ses_source_arn
#   email_config_from_email_address = var.email_config_from_email_address
# }

# module "rds-aurora" {
#   source = "./modules/rds-aurora"

#   db_subnet_ids                         = var.private_subnet_ids
#   nodes                                 = var.nodes
#   engine                                = var.engine
#   availability_zones                    = var.availability_zones
#   instance_class                        = var.instance_class
#   pub_access                            = var.pub_access
#   apply_immediately                     = var.apply_immediately
#   engine_version                        = var.engine_version
#   db_name                               = var.db_name
#   master_user                           = var.master_user
#   backup_retention_period               = var.backup_retention_period
#   preferred_backup_window               = var.preferred_backup_window
#   iam_database_authentication_enabled   = var.iam_database_authentication_enabled
#   enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
#   skip_final_snapshot                   = var.skip_final_snapshot
#   sg_rds                                = module.security-groups.sg_rds
#   monitoring_interval                   = var.monitoring_interval
#   performance_insights_enabled          = var.performance_insights_enabled
#   performance_insights_retention_period = var.performance_insights_retention_period
# }


module "eks-cluster" {
  source = "./modules/eks-cluster"

  aws_region                           = var.aws_region
  instance_type                        = var.instance_type
  instance_keypair                     = var.instance_keypair
  vpc_id                               = module.vpc.vpc_id
  public_subnets                       = [module.vpc.subnet_pub_app1, module.vpc.subnet_pub_app2, module.vpc.subnet_pub_app3]
  private_subnets                      = [module.vpc.subnet_pri_app1, module.vpc.subnet_pri_app2, module.vpc.subnet_pri_app3]
  bastion_sg_id                        = module.vpc.sg_bastion
  ec2_instance_sg_id                   = module.vpc.sg_ec2
  cluster_name                         = var.cluster_name
  cluster_service_ipv4_cidr            = var.cluster_service_ipv4_cidr
  cluster_version                      = var.cluster_version
  cluster_endpoint_private_access      = var.cluster_endpoint_private_access
  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  # business_divsion                     = var.business_divsion
}