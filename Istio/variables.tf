variable "kubernetes_host" {
  description = "The hostname (in form of URI) of the Kubernetes master"
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

variable "kubernetes_cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
  default     = "kubernetes"
}

variable "istio_version" {
  description = "The version of Istio to install"
  type        = string
  default     = "1.18.0"
}

variable "istio_namespace" {
  description = "The namespace to install Istio into"
  type        = string
  default     = "istio-system"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "my-service"
}

variable "app_namespace" {
  description = "Namespace of the application"
  type        = string
  default     = "app-namespace"
}

variable "domain" {
  description = "Domain for the application"
  type        = string
  default     = "my-service.example.com"
}

variable "tls_crt" {
  description = "TLS certificate content"
  type        = string
  default     = ""
}

variable "tls_key" {
  description = "TLS private key content"
  type        = string
  default     = ""
}
# variables.tf

variable "enable_autoscaling" {
  description = "Enable autoscaling for Istio components"
  type        = bool
  default     = true
}

variable "istiod_autoscaling" {
  description = "Autoscaling settings for istiod"
  type = object({
    min_replicas           = number
    max_replicas           = number
    target_cpu_utilization = number
  })
  default = {
    min_replicas           = 1
    max_replicas           = 5
    target_cpu_utilization = 80
  }
}

variable "ingressgateway_autoscaling" {
  description = "Autoscaling settings for Istio ingressgateway"
  type = object({
    min_replicas           = number
    max_replicas           = number
    target_cpu_utilization = number
  })
  default = {
    min_replicas           = 1
    max_replicas           = 5
    target_cpu_utilization = 80
  }
}
