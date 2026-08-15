variable "cluster_name" {
  type = string
}
variable "cluster_version" {
  type = string
  default = "1.28"
}
variable "vpc_id" {
  type = string
}
variable "private_subnets" {
  type = list(string)
}
variable "public_subnets" {
  type = list(string)
  default = []
}
variable "node_groups" {
  type = map(any)
  default = {}
}
variable "tags" {
  type = map(string)
  default = {}
}
