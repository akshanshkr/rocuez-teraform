//vpc
aws_region         = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
main_vpc_cidr      = "10.1.0.0/16"
main_vpc_class_b   = "10.1"

//eks
instance_type    = "t2.micro"
instance_keypair = "ansible-master"

cluster_name                         = "Rocuez"
cluster_service_ipv4_cidr            = ["172.20.0.0/16"]
cluster_version                      = "1.31"
cluster_endpoint_private_access      = false
cluster_endpoint_public_access       = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
node_disk_size                       = "40"
node_instace_type                    = ["t2.micro"]
node_capacity_type                   = "ON_DEMAND"