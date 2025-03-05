# variables.tf

# Optional: Define any variables you might want to use in your Terraform configuration
variable "region" {
  description = "AWS region for deploying resources"
  default     = "us-west-2"
}

variable "kubernetes_config_path" {
  description = "Path to the kubeconfig file"
  default     = "~/.kube/config"
}
