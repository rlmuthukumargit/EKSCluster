terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.50"
    }
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.private_subnets

  # EKS API endpoint access
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_enabled_log_types    = var.cluster_enabled_log_types
  enable_irsa                  = true
  eks_managed_node_groups      = var.node_groups
  create_cloudwatch_log_group  = var.create_cloudwatch_log_group
  create_kms_key               = var.create_kms_key
  cluster_encryption_config    = var.cluster_encryption_config

  manage_aws_auth_configmap = var.manage_aws_auth_configmap
  aws_auth_roles             = var.aws_auth_roles

  tags = var.tags
}
