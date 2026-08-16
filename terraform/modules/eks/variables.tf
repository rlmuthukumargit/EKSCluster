variable "cluster_name" {
  type = string
}
variable "cluster_version" {
  type    = string
  default = "1.32"
}
variable "vpc_id" {
  type = string
}
variable "private_subnets" {
  type = list(string)
}
variable "public_subnets" {
  type    = list(string)
  default = []
}
variable "node_groups" {
  type    = map(any)
  default = {}
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "cluster_enabled_log_types" {
  description = "List of EKS control plane log types to enable. Set [] to disable control plane logging and prevent AWS from recreating the log group."
  type        = list(string)
  default     = []
}
variable "create_cloudwatch_log_group" {
  description = "Controls whether the EKS module creates the cluster log group. Set false to reuse an existing AWS-managed log group."
  type        = bool
  default     = false
}
variable "create_kms_key" {
  description = "Controls whether the EKS module creates a KMS key for cluster encryption. Set false to reuse an existing key."
  type        = bool
  default     = false
}
variable "cluster_encryption_config" {
  description = "Encryption config for the cluster; supply provider_key_arn when reusing an existing KMS key."
  type        = any
  default     = { resources = ["secrets"] }
}
variable "manage_aws_auth_configmap" {
  description = "Determines whether the EKS module manages the aws-auth ConfigMap for Kubernetes RBAC access."
  type        = bool
  default     = true
}
variable "aws_auth_roles" {
  description = "List of IAM role mappings to add to the aws-auth ConfigMap."
  type        = list(any)
  default     = []
}
