variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "qa-eks-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "public_subnets" {
  type = list(string)
  # 6-subnet layout: 3 public subnets + 3 private subnets
  default = ["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]
}

variable "private_subnets" {
  type = list(string)
  default = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]
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
  default = "qa-eks"
}

variable "cluster_version" {
  type    = string
  default = "1.28"
}

variable "node_groups" {
  type = map(any)
  default = {
    qa-nodes = {
      desired_capacity = 2
      min_capacity     = 1
      max_capacity     = 3
      instance_types   = ["t3.medium"]
      key_name         = null
      ssh_allow_cidr   = "0.0.0.0/0"
    }
  }
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "qa"
    ManagedBy   = "terraform"
  }
}
