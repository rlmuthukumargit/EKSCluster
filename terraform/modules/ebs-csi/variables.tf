variable "cluster_oidc_issuer_url" {
  type = string
}

variable "oidc_provider_arn" {
  type = string
}

variable "kubernetes_namespace" {
  type    = string
  default = "kube-system"
}

variable "service_account_name" {
  type    = string
  default = "ebs-csi-controller-sa"
}

variable "role_name" {
  type    = string
  default = "EKS-EBS-CSI-Role"
}

variable "tags" {
  type    = map(string)
  default = {}
}
