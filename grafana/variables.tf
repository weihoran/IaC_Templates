variable "release_name" {
  description = "Helm release name for Grafana"
  type        = string
  default     = "grafana"
}

variable "chart_name" {
  description = "Helm chart name to provision"
  type        = string
  default     = "grafana"
}

variable "chart_repository" {
  description = "Helm repository for the chart"
  type        = string
  default     = "https://grafana.github.io/helm-charts"
}

variable "chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  type        = string
  default     = "6.16.6"
}

variable "chart_namespace" {
  description = "Namespace to install the chart into"
  type        = string
  default     = "default"
}

variable "max_history" {
  description = "Max history for Helm"
  type        = number
  default     = 20
}

variable "service_account" {
  description = "Name of the Service Account for Grafana"
  type        = string
  default     = ""
}

variable "service_account_annotations" {
  description = "Annotations for service account"
  type        = map(any)
  default     = {}
}

variable "replicas" {
  description = "Number of replicas of Grafana to run"
  type        = number
  default     = 1
}

variable "image" {
  description = "Docker Image for Grafana"
  type        = string
  default     = "grafana/grafana"
}

variable "tag" {
  description = "Docker Image tag for Grafana"
  type        = string
  default     = "8.1.2"
}

variable "image_pull_policy" {
  description = "Image Pull Policy for Grafana"
  type        = string
  default     = "IfNotPresent"
}

variable "extra_configmap_mounts" {
  description = "Extra ConfigMap to mount into the Container"
  type        = list(any)
  default     = []
}

variable "extra_empty_dir_mounts" {
  description = "Extra Empty DIRs to mount into the Container"
  type        = list(any)
  default     = []
}

variable "priority_class_name" {
  description = "Priority Class name for Grafana"
  type        = string
  default     = ""
}

variable "pod_annotations" {
  description = "Pod annotations"
  type        = map(any)
  default     = {}
}

variable "annotations" {
  description = "Deployment annotations"
  type        = map(any)
  default     = {}
}

variable "service_type" {
  description = "Service type"
  type        = string
  default     = "ClusterIP"
}

variable "service_port" {
  description = "Port of the service"
  type        = string
  default     = "80"
}

variable "service_target_port" {
  description = "Port in container to expose service"
  type        = string
  default     = "3000"
}

variable "service_annotations" {
  description = "Annotations for the service"
  type        = map(any)
  default     = {}
}

variable "service_labels" {
  description = "Labels for the service"
  type        = map(any)
  default     = {}
}

variable "ingress_enabled" {
  description = "Enable Ingress"
  type        = bool
  default     = false
}

variable "ingress_annotations" {
  description = "Annotations for ingress"
  type        = map(any)
  default     = {}
}

variable "ingress_labels" {
  description = "Labels for ingress"
  type        = map(any)
  default     = {}
}

variable "ingress_hosts" {
  description = "Hosts for ingress"
  type        = list(any)
  default     = []
}

variable "ingress_tls" {
  description = "TLS configuration for ingress"
  type        = list(any)
  default     = []
}

variable "resources" {
  description = "Resources for Grafana container"
  type        = map(any)
  default     = {}
}

variable "node_selector" {
  description = "Node selector for Pods"
  type        = map(any)
  default     = {}
}

variable "tolerations" {
  description = "Tolerations for pods"
  type        = list(any)
  default     = []
}

variable "affinity" {
  description = "Pod affinity"
  type        = map(any)
  default     = {}
}

variable "security_context" {
  description = "Security context for pods defined as a map which will be serialized to JSON."
  type        = any
  default = {
    runAsGroup = 472
    runAsUser  = 472
    fsGroup    = 472
  }
}

variable "extra_init_containers" {
  description = "Extra init containers"
  type        = list(any)
  default     = []
}

variable "extra_containers" {
  description = "YAML string for extra containers"
  type        = string
  default     = ""
}

variable "persistence_enabled" {
  description = "Enable PV"
  type        = bool
  default     = false
}

variable "persistence_storage_class_name" {
  description = "Storage Class name for the PV"
  type        = string
  default     = "default"
}

variable "persistence_annotations" {
  description = "Annotations for the PV"
  type        = map(any)
  default     = {}
}

variable "persistence_size" {
  description = "Size of the PV"
  type        = string
  default     = "10Gi"
}

variable "persistence_existing_claim" {
  description = "Use an existing PVC"
  type        = string
  default     = ""
}

variable "init_chown_data_enabled" {
  description = "Enable the Chown init container"
  type        = bool
  default     = true
}

variable "init_chown_data_resources" {
  description = "Resources for the Chown init container"
  type        = map(any)
  default     = {}
}

variable "env" {
  description = "Extra environment variables that will be pass onto deployment pods"
  type        = map(any)
  default     = {}
}

variable "env_from_secret" {
  description = "The name of a secret in the same kubernetes namespace which contain values to be added to the environment"
  type        = string
  default     = ""
}

variable "enable_service_links" {
  description = "Inject Kubernetes services as environment variables."
  type        = bool
  default     = true
}

variable "extra_secret_mounts" {
  description = "Additional grafana server secret mounts"
  type        = list(any)
  default     = []
}

variable "extra_volume_mounts" {
  description = "Additional grafana server volume mounts"
  type        = list(any)
  default     = []
}

variable "command" {
  description = "Define command to be executed at startup by grafana container"
  type        = list(any)
  default     = []
}

variable "plugins" {
  description = "List of plugins to install"
  default     = []
}

variable "datasources" {
  description = "YAML string to configure grafana datasources http://docs.grafana.org/administration/provisioning/#datasources"
  type        = string
  default     = ""
}

variable "notifiers" {
  description = "YAML string to configure notifiers http://docs.grafana.org/administration/provisioning/#alert-notification-channels"
  type        = string
  default     = ""
}

variable "dashboard_providers" {
  description = "YAML string to configure grafana dashboard providersref: http://docs.grafana.org/administration/provisioning/#dashboards `path` must be /var/lib/grafana/dashboards/<provider_name>"
  type        = string
  default     = ""
}

variable "dashboards" {
  description = "YAML string to configure grafana dashboard to import"
  type        = string
  default     = ""
}

variable "dashboards_config_maps" {
  description = "Reference to external ConfigMap per provider. Use provider name as key and ConfiMap name as value. YAML string"
  type        = string
  default     = ""
}

variable "main_config" {
  description = "Main Config file in YAML"
  type        = string

  default = <<EOF
paths:
  data: /var/lib/grafana/data
  logs: /var/log/grafana
  plugins: /var/lib/grafana/plugins
  provisioning: /etc/grafana/provisioning
analytics:
  check_for_updates: true
log:
  mode: console
grafana_net:
  url: https://grafana.net
EOF

}

variable "ldap_existing_secret" {
  description = "Use an existing secret for LDAP config"
  type        = string
  default     = ""
}

variable "ldap_config" {
  description = "String with contents for LDAP configuration in TOML"
  type        = string
  default     = ""
}

variable "smtp_existing_secret" {
  description = "Existing secret containing the SMTP credentials"
  type        = string
  default     = ""
}

variable "smtp_user_key" {
  description = "Key in the secret containing the SMTP username"
  type        = string
  default     = "user"
}

variable "smtp_password_key" {
  description = "Key in the secret containing the SMTP password"
  type        = string
  default     = "password"
}

variable "psp_enable" {
  description = "Enable PSP"
  type        = bool
  default     = true
}

variable "psp_use_app_armor" {
  description = "Use AppAmor in the PSP"
  type        = bool
  default     = true
}

variable "pdb" {
  description = "PodDisruptionBudget for Grafana"
  type        = map(any)
  default = {
    minAvailable = 1
  }
}

variable "image_renderer_enabled" {
  description = "Enable the image-renderer deployment and service"
  type        = bool
  default     = true
}

variable "image_renderer_replicas" {
  description = "Number of replicas of image-renderer to run"
  type        = number
  default     = 1
}

variable "image_renderer_image_repository" {
  description = "image-renderer Image repository"
  type        = string
  default     = "grafana/grafana-image-renderer"
}

variable "image_renderer_image_tag" {
  description = "image-renderer Image tag"
  type        = string
  default     = "latest"
}

variable "image_renderer_env" {
  description = "image-renderer extra environment variables"
  type        = map(any)
  default = {
    HTTP_HOST = "0.0.0.0"
  }
}

variable "image_renderer_service_account" {
  description = "image-renderer deployment serviceAccount"
  type        = string
  default     = ""
}

variable "image_renderer_priority_class_name" {
  description = "image-renderer deployment priority class"
  type        = string
  default     = ""
}

variable "image_renderer_security_context" {
  description = "image-renderer deployment securityContext"
  type        = any
  default     = {}
}

variable "image_renderer_port" {
  description = "image-renderer service port used by both service and deployment"
  type        = string
  default     = "8081"
}

variable "image_renderer_target_port" {
  description = "image-renderer service targetPort used by both service and deployment"
  type        = string
  default     = "8081"
}

variable "image_renderer_resources" {
  description = "Resources for image-renderer container"
  type        = map(any)
  default     = {}
}

variable "image_renderer_annotations" {
  description = "image-renderer deployment annotations"
  type        = map(any)
  default     = {}
}

variable "image_renderer_pod_annotations" {
  description = "image-renderer pod annotations"
  type        = map(any)
  default     = {}
}
