# Create AWS EKS Node Group - Private
#/*
resource "aws_eks_node_group" "eks_ng_private" {
  cluster_name = aws_eks_cluster.eks_cluster.name

  # node_group_name = "${local.name}-eks-ng-private"
  node_group_name = "${var.env}-eks-ng-private"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = var.private_subnets
  version         = var.cluster_version #(Optional: Defaults to EKS Cluster Kubernetes version)    

  ami_type       = var.node_ami_type
  capacity_type  = var.node_capacity_type
  disk_size      = var.node_disk_size
  instance_types = var.node_instace_type


  remote_access {
    ec2_ssh_key = var.node_ec2_ssh_key
  }

  scaling_config {
    
    desired_size = var.node_scaling_config_desired_size
    min_size     = var.node_scaling_config_min_size
    max_size     = var.node_scaling_config_max_size
  }

  # Desired max percentage of unavailable worker nodes during node group update.
  update_config {
    max_unavailable = 1
    #max_unavailable_percentage = 50    # ANY ONE TO USE
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]
  # tags = {
  #   Name = "Private-Node-Group"
  # }
  tags = {
    Name        = "rocuez-${var.env}-Private-Node-Group"
    Environment = var.env
    Maintainer  = "Terraform"
  }
}

