# Create AWS EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "advskill-${terraform.workspace}-eks_cluster"
  role_arn = aws_iam_role.eks_master_role.arn
  # version  = var.cluster_version

  vpc_config {
    subnet_ids              = var.public_subnets
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }

  # kubernetes_network_config {
  #   service_ipv4_cidr = var.cluster_service_ipv4_cidr
  # }
  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr[0] # Use the first element of the list
  }

  # Enable EKS Cluster Control Plane Logging
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
  ]
  tags = {
    Name        = "advskill-${terraform.workspace}-eks_cluster"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}