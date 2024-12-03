variable "kubernetes_host" {
  description = "The hostname of the Kubernetes master"
  type        = string
}

variable "kubernetes_cluster_ca_certificate" {
  description = "The PEM-encoded certificate authority certificates for the Kubernetes cluster"
  type        = string
}

variable "kubernetes_client_certificate" {
  description = "The PEM-encoded client certificate for TLS authentication"
  type        = string
}

variable "kubernetes_client_key" {
  description = "The PEM-encoded client key for TLS authentication"
  type        = string
}

variable "istio_namespace" {
  description = "The namespace where Istio is installed"
  type        = string
}

variable "advanced_settings" {
  description = "Map of advanced settings for Istio"
  type        = any
  default     = {}
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "app_namespace" {
  description = "Namespace of the application"
  type        = string
}

variable "domain" {
  description = "Domain for the application"
  type        = string
}
