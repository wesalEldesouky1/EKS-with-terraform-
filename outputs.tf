output "cluster_id" {
  description = "The ID of the EKS cluster."
  value       = aws_eks_cluster.example.id
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = aws_eks_cluster.example.endpoint
}

output "cluster_security_group_id" {
  description = "The security group ID attached to the EKS cluster."
  value       = aws_eks_cluster.example.vpc_config[0].security_group_ids
}

output "cluster_certificate_authority_data" {
  description = "The base64 encoded certificate data required to communicate with your cluster."
  value       = aws_eks_cluster.example.certificate_authority[0].data
}

output "node_group_iam_role_arn" {
  description = "The IAM role ARN for the EKS node group."
  value       = aws_eks_node_group.example.node_role_arn
}

output "node_group_status" {
  description = "The status of the EKS node group."
  value       = aws_eks_node_group.example.status
}