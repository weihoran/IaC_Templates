output "istio_namespace" {
  description = "The namespace where Istio is installed"
  value       = var.istio_namespace
}

output "app_namespace" {
  description = "The namespace of the application"
  value       = var.app_namespace
}
