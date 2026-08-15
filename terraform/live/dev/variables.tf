variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "dev-eks-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "public_subnets" {
  type = list(string)
  default = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "private_subnets" {
  type = list(string)
  default = ["10.10.101.0/24", "10.10.102.0/24"]
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

variable "cluster_name" {
  type    = string
  default = "dev-eks"
}

variable "cluster_version" {
  type    = string
  default = "1.28"
}

variable "node_groups" {
  type = map(any)
  default = {
    dev-nodes = {
      desired_capacity = 1
      min_capacity     = 1
      max_capacity     = 2
      instance_types   = ["t3.medium"]
      key_name         = null
      ssh_allow_cidr   = "0.0.0.0/0"
    }
  }
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
