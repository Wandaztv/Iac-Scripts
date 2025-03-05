# outputs.tf

# Output the external IP address of the ingress controller service
output "nginx_ingress_service" {
  description = "External IP address of the NGINX Ingress Controller"
  value       = kubernetes_service.nginx_ingress_controller.load_balancer_ingress[0].ip
}
