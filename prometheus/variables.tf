variable "prometheus_enable" {
  description = "Enable Prometheus stack. Disable to use independent components like KSM and Node Exporter."
  default     = true
}

variable "release_name" {
  description = "Helm release name for Prometheus"
  default     = "prometheus"
}

variable "chart_name" {
  description = "Helm chart name to provision"
  default     = "prometheus"
}

variable "chart_repository" {
  description = "Helm repository for the chart"
  default     = "https://prometheus-community.github.io/helm-charts"
}

variable "chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = ""
}

variable "chart_namespace" {
  description = "Namespace to install the chart into"
  default     = "default"
}

variable "max_history" {
  description = "Max History for Helm"
  default     = 20
}

variable "pod_security_policy_enable" {
  description = "Create PodSecurityPolicy Resources"
  default     = true
}

variable "image_pull_secrets" {
  description = "Image pull secrets, if any"
  default     = {}
}

variable "extra_scrape_configs" {
  description = "YAML String for extra scrape configs"
  default     = ""
}

variable "enable_network_policy" {
  description = "Create a NetworkPolicy resource"
  default     = "false"
}

variable "kube_state_metrics_service_account" {
  description = "Name of the service account for kubeStateMetrics. Defaults to component's fully qualified name."
  default     = ""
}

variable "pushgateway_service_account" {
  description = "Name of the service account for pushgateway. Defaults to component's fully qualified name."
  default     = ""
}

variable "server_service_account" {
  description = "Name of the service account for server. Defaults to component's fully qualified name."
  default     = ""
}

variable "kube_state_metrics_service_account_annotations" {
  description = "Annotations for the service account"
  default     = {}
}

variable "pushgateway_service_account_annotations" {
  description = "Annotations for the service account"
  default     = {}
}

variable "server_service_account_annotations" {
  description = "Annotations for the service account"
  default     = {}
}

################################
# ConfigMap Reload
################################
variable "configmap_name" {
  description = "Name of the ConfigMap Reload container"
  default     = "configmap-reload"
}

variable "configmap_image_repo" {
  description = "Docker Image repo for ConfigMap Reload"
  default     = "jimmidyson/configmap-reload"
}

variable "configmap_image_tag" {
  description = "Docker image tag for ConfigMap Reload"
  default     = "v0.5.0"
}

variable "configmap_pull_policy" {
  description = "Image pull policy for ConfigMap reload"
  default     = "IfNotPresent"
}

variable "configmap_extra_args" {
  description = "Extra arguments for ConfigMap Reload"
  default     = {}
}

variable "configmap_extra_volumes" {
  description = "Extra volumes for ConfigMap Extra Volumes"
  default     = []
}

variable "configmap_resources" {
  description = "Resources for ConfigMap Reload pod"
  default     = {}
}

################################
# Alertmanager
################################
variable "alertmanager_enable" {
  description = "Enable Alertmanager"
  default     = "true"
}

variable "alertmanager_release_name" {
  description = "Helm release name for Alertmanager"
  default     = "alertmanager"
}

variable "alertmanager_chart_name" {
  description = "Helm Alertmanager chart name to provision"
  default     = "alertmanager"
}

variable "alertmanager_chart_repository" {
  description = "Helm repository for the Alertmanager chart"
  default     = "https://prometheus-community.github.io/helm-charts"
}

variable "alertmanager_chart_version" {
  description = "Version of Alertmanager chart to install. Set to empty to install the latest version"
  default     = ""
}

variable "alertmanager_chart_namespace" {
  description = "Namespace to install the Alertmanager chart into"
  default     = "default"
}

variable "alertmanager_repository" {
  description = "Docker repository for Alert Manager"
  default     = "quay.io/prometheus/alertmanager"
}

variable "alertmanager_tag" {
  description = "Tag for Alertmanager Docker Image"
  default     = "v0.22.2"
}

variable "alertmanager_pull_policy" {
  description = "Image pull policy for Alertmanager"
  default     = "IfNotPresent"
}

variable "alertmanager_service_account" {
  description = "Name of the service account for AlertManager. Defaults to component's fully qualified name."
  default     = ""
}

variable "alertmanager_service_account_annotations" {
  description = "Annotations for the service account"
  default     = {}
}

variable "alertmanager_extra_args" {
  description = "Extra arguments for Alertmanager container"
  default     = {}
}

variable "alertmanager_ingress_enabled" {
  description = "Enable ingress for Alertmanager"
  default     = "false"
}

variable "alertmanager_ingress_annotations" {
  description = "Annotations for Alertmanager ingress"
  default     = {}
}

variable "alertmanager_ingress_hosts" {
  description = "List of Hosts for Alertmanager ingress"
  default     = []
}

variable "alertmanager_ingress_tls" {
  description = "TLS configurationf or Alertmanager ingress"
  default     = []
}

variable "alertmanager_statefulset_annotations" {
  description = "Annotations for Alertmanager statefulSet"
  default     = {}
}

variable "alertmanager_annotations" {
  description = "Annotations for Alertmanager pods"
  default     = {}
}

variable "alertmanager_tolerations" {
  description = "Tolerations for Alertmanager"
  default     = []
}

variable "alertmanager_node_selector" {
  description = "Node selector for alertmanager pods"
  default     = {}
}

variable "alertmanager_affinity" {
  description = "Affinity for alertmanager pods"
  default     = {}
}

variable "alertmanager_pv_enabled" {
  description = "Enable persistent volume on Alertmanager"
  default     = "true"
}

variable "alertmanager_pv_access_modes" {
  description = "alertmanager data Persistent Volume access modes"

  default = [
    "ReadWriteOnce",
  ]
}

variable "alertmanager_pv_size" {
  description = "alertmanager data Persistent Volume size"
  default     = "2Gi"
}

variable "alertmanager_storage_class" {
  description = "Storage class for alertmanager PV. If set to \"-\", storageClassName: \"\", which disables dynamic provisioning"
  default     = ""
}

variable "alertmanager_replica" {
  description = "Number of replicas for AlertManager"
  default     = 1
}

variable "alertmanager_resources" {
  description = "Resources for alertmanager"
  default     = {}
}

variable "alertmanager_security_context" {
  description = "Security context for alertmanager pods defined as a map which will be serialized to JSON."
  default = {
    fsGroup = 65534
    seccompProfile = {
      type = "RuntimeDefault"
    }
  }
}

variable "alertmanager_container_security_context" {
  description = "Security context for alertmanager containers defined as a map which will be serialized to JSON."
  default = {
    allowPrivilegeEscalation = false
    runAsGroup               = 65534
    runAsNonRoot             = true
    runAsUser                = 65534
  }
}

variable "alertmanager_service_annotations" {
  description = "Annotations for Alertmanager service"
  default     = {}
}

variable "alertmanager_service_port" {
  description = "Service port for Alertmanager"
  default     = 80
}

variable "alertmanager_service_type" {
  description = "Type of service for Alertmanager"
  default     = "ClusterIP"
}

variable "alertmanager_pdb" {
  description = "PDB for Alertmanager"

  default = {
    maxUnavailable = 1
  }
}

variable "alertmanager_config" {
  description = "Additional ConfigMap entries for Alertmanager in YAML string"
  sensitive   = true

  default = <<EOF
global: {}
  # slack_api_url: ''

templates:
  - '/etc/alertmanager/*.tmpl'

receivers:
  - name: default-receiver
    # slack_configs:
    #  - channel: '@you'
    #    send_resolved: true

route:
  group_wait: 10s
  group_interval: 5m
  receiver: default-receiver
  repeat_interval: 3h
EOF
}

################################
# Kube State Metrics
################################
variable "kube_state_metrics_enable" {
  description = "Enable Kube State Metrics"
  default     = "true"
}

variable "kube_state_metrics_release_name" {
  description = "Helm release name for Kube State Metrics"
  default     = "kube-state-metrics"
}

variable "kube_state_metrics_chart_name" {
  description = "Helm chart name to provision"
  default     = "kube-state-metrics"
}

variable "kube_state_metrics_chart_repository" {
  description = "Helm repository for the chart"
  default     = "https://prometheus-community.github.io/helm-charts"
}

variable "kube_state_metrics_chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = ""
}

variable "kube_state_metrics_chart_namespace" {
  description = "Namespace to install the chart into"
  default     = "default"
}

variable "kube_state_metrics_repository" {
  description = "Docker repository for Kube State Metrics"
  default     = "registry.k8s.io/kube-state-metrics/kube-state-metrics"
}

variable "kube_state_metrics_tag" {
  description = "Tag for Kube State Metrics Docker Image"
  default     = "v2.1.0"
}

variable "kube_state_metrics_pull_policy" {
  description = "Image pull policy for Kube State Metrics"
  default     = "IfNotPresent"
}

variable "kube_state_metrics_autosharding" {
  description = <<EOF
If set to true, this will deploy kube-state-metrics as a StatefulSet and the data
will be automatically sharded across <.Values.replicas> pods using the built-in
autodiscovery feature: https://github.com/kubernetes/kube-state-metrics#automated-sharding
This is an experimental feature and there are no stability guarantees.
EOF
  default     = false
}

variable "kube_state_metrics_priority_class_name" {
  description = "Priority Class Name for Kube State Metrics pods"
  default     = ""
}

variable "kube_state_metrics_extra_args" {
  description = "Extra arguments for Kube State Metrics container"
  default     = {}
}

variable "kube_state_metrics_extra_env" {
  description = "Extra environment variables for Kube State Metrics container"
  default     = {}
}

variable "kube_state_metrics_annotations" {
  description = "Annotations for Kube State Metrics pods"
  default     = {}
}

variable "kube_state_metrics_tolerations" {
  description = "Tolerations for Kube State Metrics"
  default     = []
}

variable "kube_state_metrics_affinity" {
  description = "Affinity for Kube State Metrics"
  default     = {}
}

variable "kube_state_metrics_labels" {
  description = "Labels for Kube State Metrics"
  default     = {}
}

variable "kube_state_metrics_node_selector" {
  description = "Node selector for Kube State Metrics pods"
  default     = {}
}

variable "kube_state_metrics_replica" {
  description = "Number of replicas for Kube State Metrics"
  default     = 1
}

variable "kube_state_metrics_resources" {
  description = "Resources for Kube State Metrics"
  default     = {}
}

variable "kube_state_metrics_security_context" {
  description = "Security context for kube_state_metrics pods defined as a map which will be serialized to JSON."

  default = {
    enabled    = true
    runAsGroup = 65534
    runAsUser  = 65534
    fsGroup    = 65534
    seccompProfile = {
      type = "RuntimeDefault"
    }
  }
}

variable "kube_state_metrics_container_security_context" {
  description = "Security context for kube_state_metrics containers defined as a map which will be serialized to JSON."
  default     = {}
}

variable "kube_state_metrics_service_annotations" {
  description = "Annotations for Kube State Metrics service"

  default = {
    "prometheus.io/scrape" = "true"
  }
}

variable "kube_state_metrics_service_cluster_ip" {
  description = "Cluster IP for Kube State Metrics Service"
  default     = "None"
}

variable "kube_state_metrics_service_lb_ip" {
  description = "Load Balancer IP for Kube State Metrics service"
  default     = ""
}

variable "kube_state_metrics_service_port" {
  description = "Service port for Kube State Metrics"
  default     = 80
}

variable "kube_state_metrics_service_type" {
  description = "Type of service for Kube State Metrics"
  default     = "ClusterIP"
}

variable "kube_state_metrics_pod_security_policy_annotations" {
  description = "PodSecurityPolicy annotations for Kube State Metrics"
  default = {
    "apparmor.security.beta.kubernetes.io/allowedProfileNames" = "runtime/default"
    "apparmor.security.beta.kubernetes.io/defaultProfileName"  = "runtime/default"
  }
}

variable "kube_state_metrics_pod_security_policy_additional_volumes" {
  description = "PodSecurityPolicy additional volumes for Kube State Metrics"
  default     = []
}

variable "kube_state_metrics_pdb" {
  description = "PDB for Kubestatemetrics"
  default     = { maxUnavailable = 1 }
}

variable "kube_state_metrics_host_network" {
  description = "Use host network for KSM"
  default     = false
}

variable "kube_state_metrics_metric_allow_list" {
  description = "This list of metrics to be exposed for KSM"
  default     = []
}

variable "kube_state_metrics_metric_deny_list" {
  description = "This list of metrics not to be enabled for KSM"
  default     = []
}

variable "kube_state_metrics_metric_label_allow_list" {
  description = "This list of additional Kubernetes label keys that will be used in the resource's lables metric"
  default     = []
}

variable "kube_state_metrics_collection_namespace" {
  description = "Specific namespaces to collect metrics for"
  default     = ""
}

variable "kube_state_metrics_collectors" {
  description = "Collectors for Kube state metrics"
  default = [
    "certificatesigningrequests",
    "configmaps",
    "cronjobs",
    "daemonsets",
    "deployments",
    "endpoints",
    "horizontalpodautoscalers",
    "ingresses",
    "jobs",
    "limitranges",
    "mutatingwebhookconfigurations",
    "namespaces",
    "networkpolicies",
    "nodes",
    "persistentvolumeclaims",
    "persistentvolumes",
    "poddisruptionbudgets",
    "pods",
    "replicasets",
    "replicationcontrollers",
    "resourcequotas",
    "secrets",
    "services",
    "statefulsets",
    "storageclasses",
    "validatingwebhookconfigurations",
    "verticalpodautoscalers",
    "volumeattachments",
  ]
}

################################
# Node Exporter
################################
variable "node_exporter_enable" {
  description = "Enable Node Exporter"
  default     = "true"
}

variable "node_exporter_release_name" {
  description = "Helm release name for Node Exporter"
  default     = "prometheus-node-exporter"
}

variable "node_exporter_chart_name" {
  description = "Helm chart name to provision for Node Exporter"
  default     = "prometheus-node-exporter"
}

variable "node_exporter_chart_repository" {
  description = "Helm repository for the Node Exporter chart"
  default     = "https://prometheus-community.github.io/helm-charts"
}

variable "node_exporter_chart_version" {
  description = "Version of Node Exporter Chart to install. Set to empty to install the latest version"
  default     = ""
}

variable "node_exporter_chart_namespace" {
  description = "Namespace to install the chart into"
  default     = "default"
}

variable "node_exporter_host_network" {
  description = "Use the Host network namespace for Node Exporter"
  default     = "true"
}

variable "node_exporter_repository" {
  description = "Docker repository for Node Exporter"
  default     = "quay.io/prometheus/node-exporter"
}

variable "node_exporter_tag" {
  description = "Tag for Node Exporter Docker Image"
  default     = "v1.2.0"
}

variable "node_exporter_pull_policy" {
  description = "Image pull policy for Node Exporter"
  default     = "IfNotPresent"
}

variable "node_exporter_service_account" {
  description = "Name of the service account for nodeExporter. Defaults to component's fully qualified name."
  default     = ""
}

variable "node_exporter_service_account_annotations" {
  description = "Annotations for the service account"
  default     = {}
}

variable "node_exporter_enable_pod_security_policy" {
  description = "Create PodSecurityPolicy for Node Exporter"
  default     = "false"
}

variable "node_exporter_priority_class_name" {
  description = "Priority Class Name for Node Exporter pods"
  default     = ""
}

variable "node_exporter_extra_args" {
  description = "Extra arguments for Node Exporter container"
  default     = {}
}

variable "node_exporter_annotations" {
  description = "Annotations for Node Exporter pods"
  default     = {}
}

variable "node_exporter_tolerations" {
  description = "Tolerations for Node Exporter"
  default     = []
}

variable "node_exporter_labels" {
  description = "Labels for Node Exporter"
  default     = {}
}

variable "node_exporter_node_selector" {
  description = "Node selector for node_exporter pods"
  default     = {}
}

variable "node_exporter_affinity" {
  description = "Affinity for node_exporter pods"
  default     = {}
}

variable "node_exporter_resources" {
  description = "Resources for node_exporter"
  default     = {}
}

variable "node_exporter_security_context" {
  description = "Security context for node_exporter pods defined as a map which will be serialized to JSON."
  default = {
    fsGroup            = 65534
    runAsGroup         = 65534
    runAsNonRoot       = true
    runAsUser          = 65534
    supplementalGroups = [0]
    seccompProfile = {
      type = "RuntimeDefault"
    }
  }
}

variable "node_exporter_service_annotations" {
  description = "Annotations for Node Exporter service"

  default = {
    "prometheus.io/scrape" = "true"
  }
}

variable "node_exporter_service_port" {
  description = "Service port for Node Exporter"
  default     = 9100
}

variable "node_exporter_service_type" {
  description = "Type of service for Node Exporter"
  default     = "ClusterIP"
}

variable "node_exporter_host_path_mounts" {
  description = "Host Path Mounts for Node Exporter"
  default     = []
}

variable "node_exporter_config_map_mounts" {
  description = "ConfigMap Mounts for Node Exporter"
  default     = []
}

variable "node_exporter_pod_security_policy_annotations" {
  description = "PodSecurityPolicy annotations for Node exporter"
  default = {
    "seccomp.security.alpha.kubernetes.io/allowedProfileNames" = "docker/default,runtime/default"
    "apparmor.security.beta.kubernetes.io/allowedProfileNames" = "runtime/default"
    "seccomp.security.alpha.kubernetes.io/defaultProfileName"  = "runtime/default"
    "apparmor.security.beta.kubernetes.io/defaultProfileName"  = "runtime/default"
  }
}

################################
# Pushgateway
################################
variable "pushgateway_enable" {
  description = "Enable Pushgateway"
  default     = "true"
}

variable "pushgateway_repository" {
  description = "Docker repository for Pushgateway"
  default     = "quay.io/prometheus/pushgateway"
}

variable "pushgateway_tag" {
  description = "Tag for Pushgateway Docker Image"
  default     = "v1.4.1"
}

variable "pushgateway_pull_policy" {
  description = "Image pull policy for Pushgateway"
  default     = "IfNotPresent"
}

variable "pushgateway_priority_class_name" {
  description = "Priority Class Name for Pushgateway pods"
  default     = ""
}

variable "pushgateway_extra_args" {
  description = "Extra arguments for Pushgateway container"
  default     = {}
}

variable "pushgateway_extra_env" {
  description = "Extra environment variables for Pushgateway container"
  default     = {}
}

variable "pushgateway_extra_init_containers" {
  description = "Additional InitContainers to initialize the Pushgateway pod"
  default     = []
}

variable "pushgateway_deployment_annotations" {
  description = "Annotations to be added to Pushgateway deployment"
  default     = {}
}

variable "pushgateway_ingress_enabled" {
  description = "Enable ingress for Pushgateway"
  default     = "false"
}

variable "pushgateway_ingress_annotations" {
  description = "Annotations for Pushgateway ingress"
  default     = {}
}

variable "pushgateway_ingress_extra_labels" {
  description = "Additional labels for Pushgateway ingress"
  default     = {}
}

variable "pushgateway_ingress_hosts" {
  description = "List of Hosts for Pushgateway ingress"
  default     = []
}

variable "pushgateway_ingress_path" {
  description = "Path of Pushgateway ingress"
  default     = "/"
}

variable "pushgateway_ingress_extra_paths" {
  description = "Extra paths to prepend to every host configuration for Pushgateway ingress"
  default     = []
}

variable "pushgateway_ingress_tls" {
  description = "TLS configurationf or Pushgateway ingress"
  default     = []
}

variable "pushgateway_annotations" {
  description = "Annotations for Pushgateway pods"
  default     = {}
}

variable "pushgateway_tolerations" {
  description = "Tolerations for Pushgateway"
  default     = []
}

variable "pushgateway_node_selector" {
  description = "Node selector for pushgateway pods"
  default     = {}
}

variable "pushgateway_pv_enabled" {
  description = "Enable persistent volume on Pushgateway"
  default     = "true"
}

variable "pushgateway_pv_access_modes" {
  description = "pushgateway data Persistent Volume access modes"

  default = [
    "ReadWriteOnce",
  ]
}

variable "pushgateway_pv_annotations" {
  description = "Annotations for Pushgateway PV"
  default     = {}
}

variable "pushgateway_pv_existing_claim" {
  description = "Use an existing PV claim for pushgateway"
  default     = ""
}

variable "pushgateway_pv_size" {
  description = "pushgateway data Persistent Volume size"
  default     = "2Gi"
}

variable "pushgateway_replica" {
  description = "Number of replicas for pushgateway"
  default     = 1
}

variable "pushgateway_resources" {
  description = "Resources for pushgateway"
  default     = {}
}

variable "pushgateway_security_context" {
  description = "Security context for pushgateway pods defined as a map which will be serialized to JSON"

  default = {
    runAsUser    = 65534
    runAsNonRoot = true
    seccompProfile = {
      type = "RuntimeDefault"
    }
  }
}

variable "pushgateway_service_annotations" {
  description = "Annotations for Pushgateway service"

  default = {
    "prometheus.io/probe" = "pushgateway"
  }
}

variable "pushgateway_service_labels" {
  description = "Labels for Pushgateway service"
  default     = {}
}

variable "pushgateway_service_cluster_ip" {
  description = "Cluster IP for Pushgateway Service"
  default     = ""
}

variable "pushgateway_service_external_ips" {
  description = "External IPs for Pushgateway service"
  default     = []
}

variable "pushgateway_service_lb_ip" {
  description = "Load Balancer IP for Pushgateway service"
  default     = ""
}

variable "pushgateway_service_lb_source_ranges" {
  description = "List of source CIDRs allowed to access the Pushgateway LB"
  default     = []
}

variable "pushgateway_service_port" {
  description = "Service port for Pushgateway"
  default     = 9091
}

variable "pushgateway_service_type" {
  description = "Type of service for Pushgateway"
  default     = "ClusterIP"
}

variable "pushgateway_pod_security_policy_annotations" {
  description = "PodSecurityPolicy annotations for Pushgateway"
  default = {
    "apparmor.security.beta.kubernetes.io/allowedProfileNames" = "runtime/default"
    "apparmor.security.beta.kubernetes.io/defaultProfileName"  = "runtime/default"
  }
}

variable "pushgateway_pdb_enable" {
  description = "Enable PDB"
  default     = true
}

variable "pushgateway_pdb_max_unavailable" {
  description = "Max unavailable pods"
  default     = 1
}

################################
# Server
################################
variable "server_enable" {
  description = "Deploy Prometheus Server"
  default     = "true"
}

variable "server_repository" {
  description = "Docker repository for server"
  default     = "quay.io/prometheus/prometheus"
}

variable "server_tag" {
  description = "Tag for server Docker Image"
  default     = "v2.28.1"
}

variable "server_pull_policy" {
  description = "Image pull policy for server"
  default     = "IfNotPresent"
}

variable "server_sidecar_containers" {
  description = "Sidecar containers for server"
  default     = []
}

variable "server_priority_class_name" {
  description = "Priority Class Name for server pods"
  default     = ""
}

variable "server_enable_service_links" {
  description = "EnableServiceLinks indicates whether information about services should be injected into pod's environment variables, matching the syntax of Docker links."
  default     = true
}

variable "server_host_network_enabled" {
  description = "Required for use in managed kubernetes clusters (such as AWS EKS) with custom CNI (such as calico), because control-plane managed by AWS cannot communicate with pods' IP CIDR and admission webhooks are not working"
  default     = false
}

variable "server_extra_args" {
  description = "Extra arguments for server container"
  default     = {}
}

variable "server_extra_env" {
  description = "Extra environment variables for server container"
  default     = {}
}

variable "server_ingress_enabled" {
  description = "Enable ingress for server"
  default     = "false"
}

variable "server_ingress_annotations" {
  description = "Annotations for server ingress"
  default     = {}
}

variable "server_ingress_extra_labels" {
  description = "Additional labels for server ingress"
  default     = {}
}

variable "server_ingress_hosts" {
  description = "List of Hosts for server ingress"
  default     = []
}

variable "server_ingress_path" {
  description = "Path of server ingress"
  default     = "/"
}

variable "server_ingress_extra_paths" {
  description = "Extra paths to prepend to every host configuration for server ingress"
  default     = []
}

variable "server_ingress_tls" {
  description = "TLS configurationf or server ingress"
  default     = []
}

variable "server_annotations" {
  description = "Annotations to be added to Prometheus server pods"
  default     = {}
}

variable "server_tolerations" {
  description = "Node tolerations for server scheduling to nodes with taints"
  default     = []
}

variable "server_node_selector" {
  description = "Node labels for Prometheus server pod assignment"
  default     = {}
}

variable "server_affinity" {
  description = "Affinity for server pods"
  default     = {}
}

variable "server_pod_labels" {
  description = "Labels to be added to Prometheus server pods"
  default     = {}
}

variable "server_host_aliases" {
  description = "hostAliases allows adding entries to /etc/hosts inside the containers"
  default     = []
}

variable "server_pv_enabled" {
  description = "Enable persistent volume on server"
  default     = "true"
}

variable "server_pv_access_modes" {
  description = "server data Persistent Volume access modes"

  default = [
    "ReadWriteOnce",
  ]
}

variable "server_pv_annotations" {
  description = "Annotations for server PV"
  default     = {}
}

variable "server_pv_existing_claim" {
  description = "Use an existing PV claim for server"
  default     = ""
}

variable "server_pv_size" {
  description = "server data Persistent Volume size"
  default     = "8Gi"
}

variable "server_emptydir_size_limit" {
  description = "Prometheus server emptyDir volume size limit"
  default     = ""
}

variable "server_vpa_enabled" {
  description = "If true a VPA object will be created for the controller (either StatefulSet or Deployemnt)"
  default     = false
}

variable "server_vpa_update_mode" {
  description = "server VPA updateMode"
  default     = ""
}

variable "server_vpa_container_policies" {
  description = "server VPA containerPolicies"
  default     = {}
}

variable "server_replica" {
  description = "Number of replicas for server"
  default     = 1
}

variable "server_resources" {
  description = "Resources for server"
  default     = {}
}

variable "server_security_context" {
  description = "Security context for server pods defined as a map which will be serialized to JSON"

  default = {
    runAsUser    = 65534
    runAsNonRoot = true
    runAsGroup   = 65534
    fsGroup      = 65534
    seccompProfile = {
      type = "RuntimeDefault"
    }
  }
}

variable "server_pod_security_policy_annotations" {
  description = "PodSecurityPolicy annotations for server"
  default = {
    "apparmor.security.beta.kubernetes.io/allowedProfileNames" = "runtime/default"
    "apparmor.security.beta.kubernetes.io/defaultProfileName"  = "runtime/default"
  }
}

variable "server_service_annotations" {
  description = "Annotations for server service"
  default = {
    "prometheus.io/probe" = "server"
  }
}

variable "server_service_labels" {
  description = "Labels for server service"
  default     = {}
}

variable "server_service_cluster_ip" {
  description = "Cluster IP for server Service"
  default     = ""
}

variable "server_service_external_ips" {
  description = "External IPs for server service"
  default     = []
}

variable "server_service_lb_ip" {
  description = "Load Balancer IP for server service"
  default     = ""
}

variable "server_service_lb_source_ranges" {
  description = "List of source CIDRs allowed to access the server LB"
  default     = []
}

variable "server_service_port" {
  description = "Service port for Prometheus server"
  default     = 9091
}

variable "server_service_session_affinity" {
  description = "Service sessionAffinity for Prometheus server"
  default     = "None"
}

variable "server_service_type" {
  description = "Type of service for Prometheus server"
  default     = "ClusterIP"
}

variable "server_service_grpc_enabled" {
  description = "Enable gRPC port on service to allow auto discovery with thanos-querier"
  default     = false
}

variable "server_service_grpc_port" {
  description = "gRPC servicePort for server service"
  default     = "10901"
}

variable "server_prefix_url" {
  description = "The URL prefix at which the container can be accessed. Useful in the case the '-web.external-url' includes a slug so that the various internal URLs are still able to access as they are in the default case."
  default     = ""
}

variable "server_base_url" {
  description = "External URL which can access alertmanager"
  default     = ""
}

variable "server_extra_flags" {
  description = "Additional flags to control Prometheus server behaviour."
  default     = []
}

variable "server_scrape_interval" {
  description = "How frequently to scrape targets by default"
  default     = "1m"
}

variable "server_scrape_timeout" {
  description = "How long until a scrape request times out"
  default     = "10s"
}

variable "server_evaluation_interval" {
  description = "How frequently to evaluate rules"
  default     = "1m"
}

variable "server_extra_volume_mounts" {
  description = "Additional Prometheus server Volume mounts"
  default     = []
}

variable "server_extra_volumes" {
  description = "Additional Prometheus server Volumes"
  default     = []
}

variable "server_extra_host_path_mounts" {
  description = "Additional Prometheus server hostPath mounts"
  default     = []
}

variable "server_extra_configmap_mounts" {
  description = "Additional Prometheus server ConfigMap mounts"
  default     = []
}

variable "server_extra_secret_mounts" {
  description = "Extra secret mounts for server"
  default     = []
}

variable "server_extra_init_containers" {
  description = "Additional InitContainers to initialize the pod"
  default     = []
}

variable "server_deployment_annotations" {
  description = "Annotations to be added to server deployment"
  default     = {}
}

variable "server_statefulset_annotations" {
  description = "Annotations to be added to server statefulSet"
  default     = {}
}

variable "server_statefulset_labels" {
  description = "Labels to be added to Prometheus server statefulSet"
  default     = {}
}

variable "server_data_retention" {
  description = "Prometheus data retention period (i.e 360h)"
  default     = ""
}

variable "server_pod_probes" {
  description = "Prometheus server readiness and liveness probe initial delay and timeout"

  default = {
    readinessProbeInitialDelay     = 30
    readinessProbePeriodSeconds    = 5
    readinessProbeTimeout          = 10
    readinessProbeFailureThreshold = 3
    readinessProbeSuccessThreshold = 1
    livenessProbeInitialDelay      = 30
    livenessProbePeriodSeconds     = 15
    livenessProbeTimeout           = 10
    livenessProbeFailureThreshold  = 3
    livenessProbeSuccessThreshold  = 1
  }
}

variable "server_termination_grace_seconds" {
  description = "Prometheus server pod termination grace period"
  default     = "300"
}

variable "server_headless_annotations" {
  description = "Annotations for server StatefulSet headless service"
  default     = {}
}

variable "server_headless_labels" {
  description = "Labels for server StatefulSet headless service"
  default     = {}
}

variable "server_headless_grpc_enabled" {
  description = "Enable gRPC port on service to allow auto discovery with thanos-querier"
  default     = false
}

variable "server_headless_grpc_port" {
  description = "gRPC servicePort for server headless service"
  default     = 10901
}

variable "server_pdb_enable" {
  description = "Enable PDB"
  default     = true
}

variable "server_pdb_max_unavailable" {
  description = "Max unavailable pods"
  default     = 1
}

variable "server_alerts" {
  description = "Prometheus server alerts entries in YAML. Ref: https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/"

  default = <<EOF
[]
# - name: Instances
#   rules:
#     - alert: InstanceDown
#       expr: up == 0
#       for: 5m
#       labels:
#         severity: page
#       annotations:
#         description: '{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 5 minutes.'
#         summary: 'Instance {{ $labels.instance }} down'
EOF
}

variable "server_rules" {
  description = "Prometheus server rules entries in YAML"

  default = <<EOF
[]
# - name: k8s_health
#   rules:
#     - record: k8s_container_oom
#       expr: increase(kube_pod_container_status_last_terminated_reason{reason="OOMKilled"}[2m]) and on(pod) increase(kube_pod_container_status_restarts_total[2m])
EOF
}

variable "server_additional_global" {
  description = "YAML string for additional global configuration for Prometheus Server"
  default     = ""
}

variable "server_config_override" {
  description = "Overriding the Prometheus server config file in YAML"
  default     = ""
}

variable "server_alert_managers_configs" {
  description = "Prometheus AlertManager configuration"
  default     = []
}

#################################
# Default Scrape Settings
#################################
variable "scrape_skip_apiserver_tls_verify" {
  description = "Skip verifying TLS Certificate for Kubernetes Master Server Scrape target. Warning: This is insecure"
  default     = false
}

variable "scrape_skip_nodes_tls_verify" {
  description = "Skip verifying TLS Certificate for Kubernetes Nodes Scrape target. Warning: This is insecure"
  default     = false
}

variable "scrape_drop_pod_containers_without_port" {
  description = "For pod targets, Prometheus generates a target per pod per container per port. For containers without a port, it leave the target in without any port. Configure to drop these targets"
  type        = bool
  default     = false
}

variable "scrape_drop_service_pod_containers_without_port" {
  description = "For service targets, Prometheus generates a target per service per pod per container per port. For containers without a port, it leave the target in without any port. Configure to drop these targets"
  type        = bool
  default     = false
}

############################
# Remote config
############################
variable "prometheus_remote_write_api_url" {
  description = "Prometheus remote write URL"
  type        = string
  default     = null
}

variable "prometheus_remote_read_api_url" {
  description = "Prometheus remote read URL"
  type        = string
  default     = null
}
