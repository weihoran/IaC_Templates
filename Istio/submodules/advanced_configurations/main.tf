# Configure the Kubernetes provider with an alias to avoid conflicts
provider "kubernetes" {
  alias                  = "advanced"
  host                   = var.kubernetes_host
  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
  client_certificate     = var.kubernetes_client_certificate
  client_key             = var.kubernetes_client_key
}

# Configure Circuit Breaking if enabled
resource "kubernetes_manifest" "destination_rule_circuit_breaking" {
  count = var.advanced_settings["enable_circuit_breaking"] ? 1 : 0
  provider = kubernetes.advanced

  manifest = {
    "apiVersion" = "networking.istio.io/v1beta1"
    "kind"       = "DestinationRule"
    "metadata" = {
      "name"      = "${var.app_name}-circuit-breaking"
      "namespace" = var.app_namespace
    }
    "spec" = {
      "host" = "${var.app_name}.${var.app_namespace}.svc.cluster.local"
      "trafficPolicy" = {
        "connectionPool" = {
          "http" = {
            "maxConnections" = var.advanced_settings["connection_pool_settings"].max_connections
          }
        }
      }
    }
  }
}

# Configure Gateway with mTLS if enabled
resource "kubernetes_manifest" "gateway_mtls" {
  count = var.advanced_settings["enable_mtls"] ? 1 : 0
  provider = kubernetes.advanced

  manifest = {
    "apiVersion" = "networking.istio.io/v1beta1"
    "kind"       = "Gateway"
    "metadata" = {
      "name"      = "my-gateway-mtls"
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
        "tls" = {
          "mode"           = "MUTUAL"
          "credentialName" = "my-credential"
        }
        "hosts" = [var.domain]
      }]
    }
  }
}

# Configure AuthorizationPolicy if enabled
resource "kubernetes_manifest" "authorization_policy" {
  count = var.advanced_settings["enable_authorization_policy"] ? 1 : 0
  provider = kubernetes.advanced

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
            "requestPrincipals" = var.advanced_settings["request_principals"]
          }
        }]
      }]
    }
  }
}
