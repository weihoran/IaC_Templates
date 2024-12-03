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

variable "enable_telemetry" {
  description = "Enable telemetry configurations"
  type        = bool
  default     = false
}