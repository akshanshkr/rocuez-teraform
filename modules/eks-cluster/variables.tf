
//ec2
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "eu-east-1"
}
# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instnace Type"
  type        = string
  default     = "t3.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type        = string
  default     = "ansible-master"
}

variable "vpc_id" {
  description = "AWS VPC ID for resources"
  type        = string
  default     = ""
}

variable "public_subnets" { 
  description = "List of public subnet ids"
  type        = list(string)
  nullable    = false
}

variable "private_subnets" { 
  description = "List of private subnet ids"
  type        = list(string)
  nullable    = false
}

variable "bastion_sg_id" {
  description = "Security group id for Bastion instance"
  type        = string
  default     = ""
}

variable "ec2_instance_sg_id" {
  description = "Security group id for ec2 instance"
  type        = string
  default     = ""
}


//EKS 
# EKS Cluster Input Variables
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "ROCUEZ-EKS"
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = list(string)
  default     = null
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



variable "node_disk_size" {}
variable "node_instace_type" {}
variable "node_capacity_type" {}