locals {
  # prefer 2 AZs in dev (but will fall back to available AZs)
  az_count = min(2, length(data.aws_availability_zones.available.names))

  cluster_admin_role = [
    {
      rolearn  = data.aws_caller_identity.current.arn
      username = "cluster-admin"
      groups   = ["system:masters"]
    }
  ]
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  azs                = slice(data.aws_availability_zones.available.names, 0, local.az_count)
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  tags               = var.tags
}

module "eks" {
  source = "../../modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
  node_groups     = var.node_groups
  tags            = var.tags

  cluster_enabled_log_types  = []
  create_cloudwatch_log_group = false
  create_kms_key             = true
  cluster_encryption_config = {
    resources = ["secrets"]
  }

  manage_aws_auth_configmap = true
  aws_auth_roles            = local.cluster_admin_role
}
