output "eks_cluster_name" {
  description = "The name of our newly created EKS Cluster."
  value       = module.eks.cluster_name
}
