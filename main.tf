module "vpc" {
  source = "./modules/vpc"
  availability_zones = var.availability_zones
  main_vpc_cidr      = var.main_vpc_cidr
  main_vpc_class_b   = var.main_vpc_class_b
}

module "eks-cluster" {
  source = "./modules/eks-cluster"
  aws_region                           = var.aws_region
  instance_type                        = var.instance_type
  instance_keypair                     = var.instance_keypair
  vpc_id                               = module.vpc.vpc_id
  public_subnets                       = [module.vpc.subnet_pub_app1, module.vpc.subnet_pub_app2]
  private_subnets                      = [module.vpc.subnet_pri_app1, module.vpc.subnet_pri_app2]
  bastion_sg_id                        = module.vpc.sg_bastion
  ec2_instance_sg_id                   = module.vpc.sg_ec2
  cluster_name                         = var.cluster_name
  cluster_service_ipv4_cidr            = var.cluster_service_ipv4_cidr
  cluster_version                      = var.cluster_version
  cluster_endpoint_private_access      = var.cluster_endpoint_private_access
  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  node_capacity_type                   = var.node_capacity_type
  node_instace_type                    = var.node_instace_type
  node_disk_size                       = var.node_disk_size
  # business_divsion                     = var.business_divsion
  }