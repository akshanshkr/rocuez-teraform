//vpc
variable "aws_region" {}
variable "availability_zones" {}
variable "main_vpc_cidr" {}
variable "main_vpc_class_b" {}

# //cognito
# variable "sms_config_external_id" {}
# variable "email_config_email_sending_acc" {}
# variable "email_config_ses_source_arn" {}
# variable "email_config_from_email_address" {}

# //rds-aurora
# variable "nodes" {}
# variable "engine" {}
# variable "instance_class" {}
# variable "pub_access" {}
# variable "apply_immediately" {}
# variable "engine_version" {}
# variable "db_name" {}
# variable "master_user" {}
# variable "backup_retention_period" {}
# variable "preferred_backup_window" {}
# variable "iam_database_authentication_enabled" {}
# variable "enabled_cloudwatch_logs_exports" {}
# variable "skip_final_snapshot" {}
# variable "monitoring_interval" {}
# variable "performance_insights_enabled" {}
# variable "performance_insights_retention_period" {}
# variable "private_subnet_ids" {}

//eks
variable "instance_type" {
  description = "EC2 Instnace Type"
  type        = string
  default     = "t3.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type        = string
  default     = "advskill-key"
}

variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "ADVSKILL-EKS"
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = list(string)
  # default     = null
  default     = ["172.20.0.0/16"]
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
  type        = string
  default     = null
}
variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# variable "business_divsion" {
#   description = "Business Division in the large organization this Infrastructure belongs"
#   type        = string
#   default     = "ADVskill"
# }