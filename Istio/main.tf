terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.5"
    }
  }
}

# Configure the Kubernetes provider
provider "kubernetes" {
  host                   = var.kubernetes_host
  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
  client_certificate     = var.kubernetes_client_certificate
  client_key             = var.kubernetes_client_key
}

# Configure the Helm provider
provider "helm" {
  kubernetes {
    host                   = var.kubernetes_host
    cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
    client_certificate     = var.kubernetes_client_certificate
    client_key             = var.kubernetes_client_key
  }
}

# Install Istio Base components
resource "helm_release" "istio_base" {
  name       = "istio-base"
  namespace  = var.istio_namespace
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
  version    = var.istio_version

  create_namespace = true
}

# Install Istio Control Plane (istiod) with resource configurations and advanced settings
resource "helm_release" "istiod" {
  name       = "istiod"
  namespace  = var.istio_namespace
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istio-control/istio-discovery"
  version    = var.istio_version

  depends_on = [helm_release.istio_base]

  # Resource Optimization
  set {
    name  = "pilot.resources.requests.cpu"
    value = var.istiod_resources.requests_cpu
  }
  set {
    name  = "pilot.resources.requests.memory"
    value = var.istiod_resources.requests_memory
  }
  set {
    name  = "pilot.resources.limits.cpu"
    value = var.istiod_resources.limits_cpu
  }
  set {
    name  = "pilot.resources.limits.memory"
    value = var.istiod_resources.limits_memory
  }

  # Advanced Configurations
  set {
    name  = "pilot.traceSampling"
    value = lookup(var.advanced_settings, "trace_sampling", 1.0)
  }

  set {
    name  = "global.proxy.accessLogFile"
    value = lookup(var.advanced_settings, "access_log_file", "/dev/stdout")
  }
}

# Install Istio Ingress Gateway with resource configurations and advanced settings
resource "helm_release" "istio_ingress" {
  name       = "istio-ingress"
  namespace  = var.istio_namespace
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "gateways/istio-ingress"
  version    = var.istio_version

  depends_on = [helm_release.istiod]

  # Resource Optimization
  set {
    name  = "gateways.istio-ingressgateway.resources.requests.cpu"
    value = var.ingressgateway_resources.requests_cpu
  }
  set {
    name  = "gateways.istio-ingressgateway.resources.requests.memory"
    value = var.ingressgateway_resources.requests_memory
  }
  set {
    name  = "gateways.istio-ingressgateway.resources.limits.cpu"
    value = var.ingressgateway_resources.limits_cpu
  }
  set {
    name  = "gateways.istio-ingressgateway.resources.limits.memory"
    value = var.ingressgateway_resources.limits_memory
  }

  # Advanced Configurations
  set {
    name  = "service.type"
    value = lookup(var.advanced_settings, "ingress_service_type", "LoadBalancer")
  }
}

# Create the application namespace
resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = var.app_namespace
  }
}

# Create a TLS secret for mTLS (if TLS data is provided)
resource "kubernetes_secret" "tls_secret" {
  count = var.tls_crt != "" && var.tls_key != "" ? 1 : 0

  metadata {
    name      = "my-credential"
    namespace = var.app_namespace
  }

  data = {
    "tls.crt" = base64encode(var.tls_crt)
    "tls.key" = base64encode(var.tls_key)
  }

  type = "kubernetes.io/tls"
}

# Create a DestinationRule for the application
resource "kubernetes_manifest" "destination_rule" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1beta1"
    "kind"       = "DestinationRule"
    "metadata" = {
      "name"      = var.app_name
      "namespace" = var.app_namespace
    }
    "spec" = {
      "host" = "${var.app_name}.${var.app_namespace}.svc.cluster.local"
      "trafficPolicy" = {
        "loadBalancer" = {
          "simple" = var.load_balancer_strategy
        }
        "connectionPool" = {
          "http" = {
            "maxConnections" = var.max_connections
          }
        }
      }
    }
  }
}

# Create a VirtualService with retries and timeouts
resource "kubernetes_manifest" "virtual_service" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1beta1"
    "kind"       = "VirtualService"
    "metadata" = {
      "name"      = var.app_name
      "namespace" = var.app_namespace
    }
    "spec" = {
      "hosts" = [var.domain]
      "gateways" = ["my-gateway"]
      "http" = [{
        "route" = [{
          "destination" = {
            "host" = var.app_name
          }
        }]
        "timeout" = var.http_timeout
        "retries" = {
          "attempts"      = var.retry_attempts
          "perTryTimeout" = var.per_try_timeout
        }
      }]
    }
  }
}

# Create a Gateway with mutual TLS enabled (if TLS data is provided)
resource "kubernetes_manifest" "gateway" {
  depends_on = [kubernetes_secret.tls_secret]

  manifest = {
    "apiVersion" = "networking.istio.io/v1beta1"
    "kind"       = "Gateway"
    "metadata" = {
      "name"      = "my-gateway"
      "namespace" = var.app_namespace
    }
    "spec" = {
      "selector" = {
        "istio" = "ingressgateway"
      }
      "servers" = [{
        "port" = {
          "number"   = 443
          "name"     = "https"
          "protocol" = "HTTPS"
        }
        "tls" = var.tls_crt != "" && var.tls_key != "" ? {
          "mode"           = "MUTUAL"
          "credentialName" = kubernetes_secret.tls_secret[0].metadata["name"]
        } : {
          "mode" = "PASSTHROUGH"
        }
        "hosts" = [var.domain]
      }]
    }
  }
}

# Create an AuthorizationPolicy for the application
resource "kubernetes_manifest" "authorization_policy" {
  manifest = {
    "apiVersion" = "security.istio.io/v1beta1"
    "kind"       = "AuthorizationPolicy"
    "metadata" = {
      "name"      = "my-auth-policy"
      "namespace" = var.app_namespace
    }
    "spec" = {
      "selector" = {
        "matchLabels" = {
          "app" = var.app_name
        }
      }
      "action" = "ALLOW"
      "rules" = [{
        "from" = [{
          "source" = {
            "requestPrincipals" = var.request_principals
          }
        }]
      }]
    }
  }
}

# Include the Telemetry sub-module if enabled
module "telemetry" {
  source = "./modules/telemetry"

  kubernetes_host                   = var.kubernetes_host
  kubernetes_cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
  kubernetes_client_certificate     = var.kubernetes_client_certificate
  kubernetes_client_key             = var.kubernetes_client_key
  istio_namespace                   = var.istio_namespace

  enable_telemetry = var.enable_telemetry
}

# Include the Advanced Configurations sub-module
module "advanced_configurations" {
  source = "./modules/advanced_configurations"

  kubernetes_host                   = var.kubernetes_host
  kubernetes_cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
  kubernetes_client_certificate     = var.kubernetes_client_certificate
  kubernetes_client_key             = var.kubernetes_client_key

  istio_namespace             = var.istio_namespace
  advanced_settings           = var.advanced_settings
  app_name                    = var.app_name
  app_namespace               = var.app_namespace
  domain                      = var.domain
}

# Include the Scalability sub-module
module "scalability" {
  source = "./scalability"

  enable_autoscaling                = var.enable_autoscaling
  istiod_autoscaling                = var.istiod_autoscaling
  ingressgateway_autoscaling        = var.ingressgateway_autoscaling
  custom_metrics_enabled            = var.custom_metrics_enabled
  custom_metrics                    = var.custom_metrics

  istio_namespace                   = var.istio_namespace
  app_name                          = var.app_name
  app_namespace                     = var.app_namespace
}
