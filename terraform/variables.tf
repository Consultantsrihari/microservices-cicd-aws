variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name for our Virtual Private Cloud (VPC)."
  type        = string
  default     = "microservices-vpc"
}

variable "cluster_name" {
  description = "The name for our Kubernetes (EKS) cluster."
  type        = string
  default     = "microservices-cluster"
}
