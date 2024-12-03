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

# Scalability Variables
variable "enable_autoscaling" {
  description = "Enable autoscaling for Istio components and applications"
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

variable "custom_metrics_enabled" {
  description = "Enable custom metrics for autoscaling"
  type        = bool
  default     = false
}

variable "custom_metrics" {
  description = "Custom metrics for autoscaling"
  type = object({
    metric_name     = string
    target_type     = string
    target_value    = number
  })
  default = {
    metric_name  = "queue_length"
    target_type  = "AverageValue"
    target_value = 100
  }
}

# Advanced Configurations Variables
variable "enable_circuit_breaking" {
  description = "Enable circuit breaking configurations"
  type        = bool
  default     = false
}

variable "connection_pool_settings" {
  description = "Connection pool settings for circuit breaking"
  type = object({
    max_connections = number
  })
  default = {
    max_connections = 100
  }
}

variable "enable_mtls" {
  description = "Enable mutual TLS in Gateway"
  type        = bool
  default     = false
}

variable "enable_authorization_policy" {
  description = "Enable AuthorizationPolicy"
  type        = bool
  default     = false
}

variable "request_principals" {
  description = "Request principals for AuthorizationPolicy"
  type        = list(string)
  default     = ["*"]
}
