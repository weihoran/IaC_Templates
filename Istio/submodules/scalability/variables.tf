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
    metric_name  = string
    target_type  = string
    target_value = number
  })
  default = {
    metric_name  = "queue_length"
    target_type  = "AverageValue"
    target_value = 100
  }
}

variable "istio_namespace" {
  description = "The namespace where Istio is installed"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "app_namespace" {
  description = "Namespace of the application"
  type        = string
}
