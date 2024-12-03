# Configure the Kubernetes provider with an alias to avoid conflicts
provider "kubernetes" {
  alias                  = "telemetry"
  host                   = var.kubernetes_host
  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
  client_certificate     = var.kubernetes_client_certificate
  client_key             = var.kubernetes_client_key
}

resource "kubernetes_manifest" "telemetry" {
  count    = var.enable_telemetry ? 1 : 0
  provider = kubernetes.telemetry

  manifest = {
    "apiVersion" = "telemetry.istio.io/v1alpha1"
    "kind"       = "Telemetry"
    "metadata" = {
      "name"      = "default"
      "namespace" = var.istio_namespace
    }
    "spec" = {
      "accessLogging" = [{
        "providers" = [{
          "name" = "envoy"
        }]
      }]
      "metrics" = [{
        "providers" = [{
          "name" = "prometheus"
        }]
      }]
      "tracing" = [{
        "providers" = [{
          "name" = "zipkin"
        }]
      }]
    }
  }
}
