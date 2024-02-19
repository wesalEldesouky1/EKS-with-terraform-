provider "aws" {
  region  = var.aws_region
  version = "~> 3.0" # Compatible version for EKS resources
}

variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}