# Configure the Kubernetes provider with an alias to avoid conflicts
provider "kubernetes" {
  alias                  = "scalability"
  host                   = var.kubernetes_host
  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
  client_certificate     = var.kubernetes_client_certificate
  client_key             = var.kubernetes_client_key
}

# Horizontal Pod Autoscaler for istiod
resource "kubernetes_horizontal_pod_autoscaler_v2" "istiod_hpa" {
  count = var.enable_autoscaling ? 1 : 0

  metadata {
    name      = "istiod"
    namespace = var.istio_namespace
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = "istiod"
    }

    min_replicas = var.istiod_autoscaling.min_replicas
    max_replicas = var.istiod_autoscaling.max_replicas

    metrics {
      type = "Resource"
      resource {
        name   = "cpu"
        target {
          type               = "Utilization"
          average_utilization = var.istiod_autoscaling.target_cpu_utilization
        }
      }
    }
  }
}

# Horizontal Pod Autoscaler for ingressgateway
resource "kubernetes_horizontal_pod_autoscaler_v2" "ingressgateway_hpa" {
  count = var.enable_autoscaling ? 1 : 0

  metadata {
    name      = "istio-ingressgateway"
    namespace = var.istio_namespace
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = "istio-ingressgateway"
    }

    min_replicas = var.ingressgateway_autoscaling.min_replicas
    max_replicas = var.ingressgateway_autoscaling.max_replicas

    metrics {
      type = "Resource"
      resource {
        name   = "cpu"
        target {
          type               = "Utilization"
          average_utilization = var.ingressgateway_autoscaling.target_cpu_utilization
        }
      }
    }
  }
}

# Horizontal Pod Autoscaler for istiod with custom metrics if enabled
resource "kubernetes_horizontal_pod_autoscaler_v2" "istiod_hpa_custom" {
  count = var.enable_autoscaling && var.custom_metrics_enabled ? 1 : 0

  metadata {
    name      = "istiod"
    namespace = var.istio_namespace
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = "istiod"
    }

    min_replicas = var.istiod_autoscaling.min_replicas
    max_replicas = var.istiod_autoscaling.max_replicas

    metrics {
      type = "Pods"
      pods {
        metric {
          name = var.custom_metrics.metric_name
        }
        target {
          type  = var.custom_metrics.target_type
          value = var.custom_metrics.target_value
        }
      }
    }
  }
}
