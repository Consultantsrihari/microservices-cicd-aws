terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  access_key = "REMOVEDVEPEMGGS5QFJIVK5"
  secret_key = "4XT1cADtwNW3wFcCh/4iLenVZ5AoPbM/XtuaEFch"
  region     = var.aws_region
}

# --- Part 1: Networking ---
# Creates a secure, private network (VPC) for our resources.
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

# --- Part 2: Container Registry (ECR) ---
# Creates a private Docker registry for each of our microservices.
resource "aws_ecr_repository" "python_backend" {
  name                 = "python-backend"
  image_tag_mutability = "MUTABLE"
  force_delete         = true # Easy cleanup for this project
}
resource "aws_ecr_repository" "react_frontend" {
  name                 = "react-frontend"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}
resource "aws_ecr_repository" "go_processor" {
  name                 = "go-processor"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

# --- Part 3: Kubernetes Cluster (EKS) ---
# Creates the actual cluster and worker nodes to run our containers.
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    one = {
      name           = "general-workers"
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2
    }
  }
}
