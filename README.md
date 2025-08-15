# microservices-cicd-aws

[![GitHub Repository](https://img.shields.io/badge/GitHub-View%20on%20GitHub-blue?logo=github)](https://github.com/Consultantsrihari/microservices-cicd-aws)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/Venkata Sri Hari)
[![Website](https://img.shields.io/badge/Website-Visit-green?logo=google-chrome)](https://Techcareerhubs.com)

This repository demonstrates a microservices architecture deployed with CI/CD on AWS. It includes three main services:

## Services

### 1. Python Backend
- Location: `python-backend/`
- Description: REST API built with Flask.
- Dockerized and ready for Kubernetes deployment.

### 2. React Frontend
- Location: `react-frontend/`
- Description: Single Page Application (SPA) built with React.
- Dockerized and ready for Kubernetes deployment.

### 3. Go Processor
- Location: `go-processor/`
- Description: Background processor written in Go, exposes a health check endpoint.
- Dockerized and ready for Kubernetes deployment.

## Infrastructure
- Kubernetes manifests in `k8s/` for deploying all services.
- Terraform scripts in `terraform/` for provisioning AWS infrastructure.

## Getting Started

### Prerequisites
- Docker
- Kubernetes (e.g., minikube, EKS)
- Terraform
- AWS CLI

### Build and Run Locally

#### Python Backend
```sh
cd python-backend
# Build Docker image
docker build -t python-backend .
```

#### React Frontend
```sh
cd react-frontend
# Build Docker image
docker build -t react-frontend .
```

#### Go Processor
```sh
cd go-processor
# Build Docker image
docker build -t go-processor .
```

### Deploy to Kubernetes
```sh
kubectl apply -f k8s/
```

### Provision AWS Infrastructure
```sh
cd terraform
terraform init
terraform apply
```

## License
MIT
