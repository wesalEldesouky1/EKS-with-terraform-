variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "kubernetes_version" {
  description = "The desired Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.21"
}

variable "node_group_name" {
  description = "The name of the node group."
  type        = string
  default     = "my-node-group"
}

variable "instance_types" {
  description = "The instance types to use for the EKS nodes."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_count" {
  description = "The desired number of nodes in the node group."
  type        = number
  default     = 3
}

variable "min_count" {
  description = "The minimum number of nodes in the node group."
  type        = number
  default     = 1
}

variable "max_count" {
  description = "The maximum number of nodes in the node group."
  type        = number
  default     = 5
}

variable "vpc_id" {
  description = "The VPC ID where the EKS cluster and node group will be deployed."
  type        = string
  default     = "vpc-12345678"
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the EKS cluster and node group."
  type        = list(string)
  default     = ["subnet-1234abcd", "subnet-abcd1234"]
}