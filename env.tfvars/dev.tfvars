//vpc
aws_region         = "eu-west-3"
availability_zones = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
main_vpc_cidr      = "10.1.0.0/16"
main_vpc_class_b   = "10.1"

//cognito
sms_config_external_id          = "4053a48b-ce39-4804-8b36-64f2e4a1fa21"
email_config_email_sending_acc  = "DEVELOPER"
email_config_ses_source_arn     = "arn:aws:ses:eu-west-3:447649942017:identity/terajob.com"
email_config_from_email_address = "Terajob <no-reply@terajob.com>"

//rds-aurora
nodes                                 = 1
engine                                = "aurora-postgresql"
instance_class                        = "db.t3.medium"
pub_access                            = true
apply_immediately                     = true
engine_version                        = "11.9"
db_name                               = "teracar"
master_user                           = "apiadmin"
backup_retention_period               = 7
preferred_backup_window               = "04:24-04:54"
iam_database_authentication_enabled   = true
enabled_cloudwatch_logs_exports       = ["postgresql"]
skip_final_snapshot                   = true
monitoring_interval                   = 60
performance_insights_enabled          = true
performance_insights_retention_period = 7

//eks
instance_type    = "t3.micro"
instance_keypair = "advskill-key"

cluster_name                         = "ADVskill"
cluster_service_ipv4_cidr            = ["172.20.0.0/16"]
cluster_version                      = "1.27"
cluster_endpoint_private_access      = false
cluster_endpoint_public_access       = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]