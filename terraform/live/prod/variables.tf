variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "prod-eks-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.30.0.0/16"
}

variable "public_subnets" {
  type = list(string)
  default = ["10.30.0.0/24", "10.30.1.0/24", "10.30.2.0/24"]
}

variable "private_subnets" {
  type = list(string)
  default = ["10.30.101.0/24", "10.30.102.0/24", "10.30.103.0/24"]
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = false
}

variable "cluster_name" {
  type    = string
  default = "prod-eks"
}

variable "cluster_version" {
  type    = string
  default = "1.28"
}

variable "node_groups" {
  type = map(any)
  default = {
    prod-ng = {
      desired_capacity = 3
      min_capacity     = 2
      max_capacity     = 5
      instance_types   = ["m6i.large"]
      key_name         = null
      ssh_allow_cidr   = "10.0.0.0/8" # restrict SSH in prod
    }
  }
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}
