module "ebs_csi" {
  source = "../../modules/ebs-csi"

  cluster_oidc_issuer_url = module.eks.cluster_oidc_issuer_url
  oidc_provider_arn       = module.eks.oidc_provider_arn
  role_name               = "dev-ebs-csi-role"

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
