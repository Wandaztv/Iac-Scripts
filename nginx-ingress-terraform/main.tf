# main.tf

# Kubernetes Provider
provider "kubernetes" {
  config_path = "~/.kube/config"  # Path to your kubeconfig file
}

# Helm Provider
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  # Path to your kubeconfig file
  }
}

# Create the NGINX Ingress Controller using Helm
resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  namespace  = "ingress-nginx"  # Namespace for ingress controller
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.0.14"  # Specify the Helm chart version
  
  values = [
    <<-EOF
    controller:
      replicaCount: 2  # Number of replicas for NGINX Ingress Controller
      service:
        externalTrafficPolicy: Local  # Use Local for preserving client IP
    EOF
  ]

  create_namespace = true
}

# Expose external service of the NGINX Ingress Controller
resource "kubernetes_service" "nginx_ingress_controller" {
  metadata {
    name      = "nginx-ingress-controller"
    namespace = "ingress-nginx"
  }

  spec {
    selector = {
      app = "ingress-nginx"
    }

    port {
      port        = 80
      target_port = 80
      protocol    = "TCP"
    }

    port {
      port        = 443
      target_port = 443
      protocol    = "TCP"
    }

    # Expose service to the external world
    type = "LoadBalancer"
  }
}

