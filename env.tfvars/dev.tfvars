//vpc
aws_region         = "ap-south-1"
# aws_region         = "us-east-1"
# 
availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
# availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

main_vpc_cidr      = "10.1.0.0/16"
main_vpc_class_b   = "10.1"

//eks
instance_type    = "t2.micro"
instance_keypair = "rocuez-node-eks"
# instance_keypair = "ansible-master"


cluster_name                         = "Rocuez"
cluster_service_ipv4_cidr            = ["172.20.0.0/16"]
cluster_version                      = "1.31"
cluster_endpoint_private_access      = false
cluster_endpoint_public_access       = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
node_disk_size                       = "40"
node_instace_type                    = ["t2.medium"]
node_capacity_type                   = "ON_DEMAND"
env                                  = "dev"
node_ec2_ssh_key                     = "rocuez-node-eks"
# node_ec2_ssh_key                     = "ansible-master"

node_ami_type                        = "AL2_x86_64"
node_scaling_config_desired_size     = 2
node_scaling_config_min_size         = 1
node_scaling_config_max_size         = 4

//ecr
ecr_repository_name                  = ["dev-api-v18","dev-cron-v18","dev-socket-v18","python-api-v18"]
image_tag_mutability                 = "IMMUTABLE"
scan_on_push                         = true

//secrets
# secret_names                         = ["cuez-api-secret", "cuez-cron-secret", "cuez-socket-secret", "cuez-python-secret"]
# secret_values                        = ["value1", "value2", "value3", "value4"]


secret_names = [
  "cuez-api-secret",
  "cuez-cron-secret",
  "cuez-socket-secret",
  "cuez-python-secret"
]

secret_values = [
  {
    api_key      = "api_value1"
  },
  {
    api_key      = "api_value2"
  },
  {
    api_key      = "api_value3"
  },
  {
    api_key      = "api_value4"
  }
]


