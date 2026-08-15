output "cluster_id" {
  value = module.eks.cluster_id
}

output "kubeconfig" {
  value     = module.eks.kubeconfig
  sensitive = true
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value     = module.eks.cluster_certificate_authority_data
  sensitive = true
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}
