# NGINX Ingress Controller with Terraform and Helm

This project sets up the NGINX Ingress Controller in a Kubernetes cluster using Terraform and Helm. It deploys the NGINX Ingress Controller using the official Helm chart and exposes the service externally via a LoadBalancer.

## Prerequisites

Before you start, ensure the following:

- **Kubernetes Cluster**: A running Kubernetes cluster (e.g., K3s, EKS, or GKE).
- **Terraform**: Install Terraform. You can download it from [terraform.io](https://www.terraform.io/downloads).
- **Helm**: Install Helm. You can follow the installation guide [here](https://helm.sh/docs/intro/install/).
- **kubectl**: Ensure `kubectl` is configured to access your Kubernetes cluster.

## Steps to Install NGINX Ingress Controller

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/Wandaztv/nginx-ingress-terraform.git
cd nginx-ingress-terraform
