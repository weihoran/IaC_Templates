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

# Install Istio Control Plane (istiod)
resource "helm_release" "istiod" {
  name       = "istiod"
  namespace  = var.istio_namespace
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istio-control/istio-discovery"
  version    = var.istio_version

  depends_on = [helm_release.istio_base]
}

# Install Istio Ingress Gateway
resource "helm_release" "istio_ingress" {
  name       = "istio-ingress"
  namespace  = var.istio_namespace
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "gateways/istio-ingress"
  version    = var.istio_version

  depends_on = [helm_release.istiod]
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
          "simple" = "LEAST_CONN"
        }
        "connectionPool" = {
          "http" = {
            "maxConnections" = 100
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
        "timeout" = "10s"
        "retries" = {
          "attempts"      = 3
          "perTryTimeout" = "2s"
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
            "requestPrincipals" = ["*"]
          }
        }]
      }]
    }
  }
}

# Create a Telemetry configuration for the application
resource "kubernetes_manifest" "telemetry" {
  manifest = {
    "apiVersion" = "telemetry.istio.io/v1alpha1"
    "kind"       = "Telemetry"
    "metadata" = {
      "name"      = "my-telemetry"
      "namespace" = var.app_namespace
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
