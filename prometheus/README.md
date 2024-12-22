# Prometheus

Deploys Prometheus and some supporting services on a Kubernetes cluster.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.alertmanager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.kube_state_metrics](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.node_exporter](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alertmanager_affinity"></a> [alertmanager\_affinity](#input\_alertmanager\_affinity) | Affinity for alertmanager pods | `map` | `{}` | no |
| <a name="input_alertmanager_annotations"></a> [alertmanager\_annotations](#input\_alertmanager\_annotations) | Annotations for Alertmanager pods | `map` | `{}` | no |
| <a name="input_alertmanager_chart_name"></a> [alertmanager\_chart\_name](#input\_alertmanager\_chart\_name) | Helm Alertmanager chart name to provision | `string` | `"alertmanager"` | no |
| <a name="input_alertmanager_chart_namespace"></a> [alertmanager\_chart\_namespace](#input\_alertmanager\_chart\_namespace) | Namespace to install the Alertmanager chart into | `string` | `"default"` | no |
| <a name="input_alertmanager_chart_repository"></a> [alertmanager\_chart\_repository](#input\_alertmanager\_chart\_repository) | Helm repository for the Alertmanager chart | `string` | `"https://prometheus-community.github.io/helm-charts"` | no |
| <a name="input_alertmanager_chart_version"></a> [alertmanager\_chart\_version](#input\_alertmanager\_chart\_version) | Version of Alertmanager chart to install. Set to empty to install the latest version | `string` | `""` | no |
| <a name="input_alertmanager_config"></a> [alertmanager\_config](#input\_alertmanager\_config) | Additional ConfigMap entries for Alertmanager in YAML string | `string` | `"global: {}\n  # slack_api_url: ''\n\ntemplates:\n  - '/etc/alertmanager/*.tmpl'\n\nreceivers:\n  - name: default-receiver\n    # slack_configs:\n    #  - channel: '@you'\n    #    send_resolved: true\n\nroute:\n  group_wait: 10s\n  group_interval: 5m\n  receiver: default-receiver\n  repeat_interval: 3h\n"` | no |
| <a name="input_alertmanager_container_security_context"></a> [alertmanager\_container\_security\_context](#input\_alertmanager\_container\_security\_context) | Security context for alertmanager containers defined as a map which will be serialized to JSON. | `map` | <pre>{<br>  "allowPrivilegeEscalation": false,<br>  "runAsGroup": 65534,<br>  "runAsNonRoot": true,<br>  "runAsUser": 65534<br>}</pre> | no |
| <a name="input_alertmanager_enable"></a> [alertmanager\_enable](#input\_alertmanager\_enable) | Enable Alertmanager | `string` | `"true"` | no |
| <a name="input_alertmanager_extra_args"></a> [alertmanager\_extra\_args](#input\_alertmanager\_extra\_args) | Extra arguments for Alertmanager container | `map` | `{}` | no |
| <a name="input_alertmanager_ingress_annotations"></a> [alertmanager\_ingress\_annotations](#input\_alertmanager\_ingress\_annotations) | Annotations for Alertmanager ingress | `map` | `{}` | no |
| <a name="input_alertmanager_ingress_enabled"></a> [alertmanager\_ingress\_enabled](#input\_alertmanager\_ingress\_enabled) | Enable ingress for Alertmanager | `string` | `"false"` | no |
| <a name="input_alertmanager_ingress_hosts"></a> [alertmanager\_ingress\_hosts](#input\_alertmanager\_ingress\_hosts) | List of Hosts for Alertmanager ingress | `list` | `[]` | no |
| <a name="input_alertmanager_ingress_tls"></a> [alertmanager\_ingress\_tls](#input\_alertmanager\_ingress\_tls) | TLS configurationf or Alertmanager ingress | `list` | `[]` | no |
| <a name="input_alertmanager_node_selector"></a> [alertmanager\_node\_selector](#input\_alertmanager\_node\_selector) | Node selector for alertmanager pods | `map` | `{}` | no |
| <a name="input_alertmanager_pdb"></a> [alertmanager\_pdb](#input\_alertmanager\_pdb) | PDB for Alertmanager | `map` | <pre>{<br>  "maxUnavailable": 1<br>}</pre> | no |
| <a name="input_alertmanager_pull_policy"></a> [alertmanager\_pull\_policy](#input\_alertmanager\_pull\_policy) | Image pull policy for Alertmanager | `string` | `"IfNotPresent"` | no |
| <a name="input_alertmanager_pv_access_modes"></a> [alertmanager\_pv\_access\_modes](#input\_alertmanager\_pv\_access\_modes) | alertmanager data Persistent Volume access modes | `list` | <pre>[<br>  "ReadWriteOnce"<br>]</pre> | no |
| <a name="input_alertmanager_pv_enabled"></a> [alertmanager\_pv\_enabled](#input\_alertmanager\_pv\_enabled) | Enable persistent volume on Alertmanager | `string` | `"true"` | no |
| <a name="input_alertmanager_pv_size"></a> [alertmanager\_pv\_size](#input\_alertmanager\_pv\_size) | alertmanager data Persistent Volume size | `string` | `"2Gi"` | no |
| <a name="input_alertmanager_release_name"></a> [alertmanager\_release\_name](#input\_alertmanager\_release\_name) | Helm release name for Alertmanager | `string` | `"alertmanager"` | no |
| <a name="input_alertmanager_replica"></a> [alertmanager\_replica](#input\_alertmanager\_replica) | Number of replicas for AlertManager | `number` | `1` | no |
| <a name="input_alertmanager_repository"></a> [alertmanager\_repository](#input\_alertmanager\_repository) | Docker repository for Alert Manager | `string` | `"quay.io/prometheus/alertmanager"` | no |
| <a name="input_alertmanager_resources"></a> [alertmanager\_resources](#input\_alertmanager\_resources) | Resources for alertmanager | `map` | `{}` | no |
| <a name="input_alertmanager_security_context"></a> [alertmanager\_security\_context](#input\_alertmanager\_security\_context) | Security context for alertmanager pods defined as a map which will be serialized to JSON. | `map` | <pre>{<br>  "fsGroup": 65534,<br>  "seccompProfile": {<br>    "type": "RuntimeDefault"<br>  }<br>}</pre> | no |
| <a name="input_alertmanager_service_account"></a> [alertmanager\_service\_account](#input\_alertmanager\_service\_account) | Name of the service account for AlertManager. Defaults to component's fully qualified name. | `string` | `""` | no |
| <a name="input_alertmanager_service_account_annotations"></a> [alertmanager\_service\_account\_annotations](#input\_alertmanager\_service\_account\_annotations) | Annotations for the service account | `map` | `{}` | no |
| <a name="input_alertmanager_service_annotations"></a> [alertmanager\_service\_annotations](#input\_alertmanager\_service\_annotations) | Annotations for Alertmanager service | `map` | `{}` | no |
| <a name="input_alertmanager_service_port"></a> [alertmanager\_service\_port](#input\_alertmanager\_service\_port) | Service port for Alertmanager | `number` | `80` | no |
| <a name="input_alertmanager_service_type"></a> [alertmanager\_service\_type](#input\_alertmanager\_service\_type) | Type of service for Alertmanager | `string` | `"ClusterIP"` | no |
| <a name="input_alertmanager_statefulset_annotations"></a> [alertmanager\_statefulset\_annotations](#input\_alertmanager\_statefulset\_annotations) | Annotations for Alertmanager statefulSet | `map` | `{}` | no |
| <a name="input_alertmanager_storage_class"></a> [alertmanager\_storage\_class](#input\_alertmanager\_storage\_class) | Storage class for alertmanager PV. If set to "-", storageClassName: "", which disables dynamic provisioning | `string` | `""` | no |
| <a name="input_alertmanager_tag"></a> [alertmanager\_tag](#input\_alertmanager\_tag) | Tag for Alertmanager Docker Image | `string` | `"v0.22.2"` | no |
| <a name="input_alertmanager_tolerations"></a> [alertmanager\_tolerations](#input\_alertmanager\_tolerations) | Tolerations for Alertmanager | `list` | `[]` | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Helm chart name to provision | `string` | `"prometheus"` | no |
| <a name="input_chart_namespace"></a> [chart\_namespace](#input\_chart\_namespace) | Namespace to install the chart into | `string` | `"default"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | Helm repository for the chart | `string` | `"https://prometheus-community.github.io/helm-charts"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of Chart to install. Set to empty to install the latest version | `string` | `""` | no |
| <a name="input_configmap_extra_args"></a> [configmap\_extra\_args](#input\_configmap\_extra\_args) | Extra arguments for ConfigMap Reload | `map` | `{}` | no |
| <a name="input_configmap_extra_volumes"></a> [configmap\_extra\_volumes](#input\_configmap\_extra\_volumes) | Extra volumes for ConfigMap Extra Volumes | `list` | `[]` | no |
| <a name="input_configmap_image_repo"></a> [configmap\_image\_repo](#input\_configmap\_image\_repo) | Docker Image repo for ConfigMap Reload | `string` | `"jimmidyson/configmap-reload"` | no |
| <a name="input_configmap_image_tag"></a> [configmap\_image\_tag](#input\_configmap\_image\_tag) | Docker image tag for ConfigMap Reload | `string` | `"v0.5.0"` | no |
| <a name="input_configmap_name"></a> [configmap\_name](#input\_configmap\_name) | Name of the ConfigMap Reload container | `string` | `"configmap-reload"` | no |
| <a name="input_configmap_pull_policy"></a> [configmap\_pull\_policy](#input\_configmap\_pull\_policy) | Image pull policy for ConfigMap reload | `string` | `"IfNotPresent"` | no |
| <a name="input_configmap_resources"></a> [configmap\_resources](#input\_configmap\_resources) | Resources for ConfigMap Reload pod | `map` | `{}` | no |
| <a name="input_enable_network_policy"></a> [enable\_network\_policy](#input\_enable\_network\_policy) | Create a NetworkPolicy resource | `string` | `"false"` | no |
| <a name="input_extra_scrape_configs"></a> [extra\_scrape\_configs](#input\_extra\_scrape\_configs) | YAML String for extra scrape configs | `string` | `""` | no |
| <a name="input_image_pull_secrets"></a> [image\_pull\_secrets](#input\_image\_pull\_secrets) | Image pull secrets, if any | `map` | `{}` | no |
| <a name="input_kube_state_metrics_affinity"></a> [kube\_state\_metrics\_affinity](#input\_kube\_state\_metrics\_affinity) | Affinity for Kube State Metrics | `map` | `{}` | no |
| <a name="input_kube_state_metrics_annotations"></a> [kube\_state\_metrics\_annotations](#input\_kube\_state\_metrics\_annotations) | Annotations for Kube State Metrics pods | `map` | `{}` | no |
| <a name="input_kube_state_metrics_autosharding"></a> [kube\_state\_metrics\_autosharding](#input\_kube\_state\_metrics\_autosharding) | If set to true, this will deploy kube-state-metrics as a StatefulSet and the data<br>will be automatically sharded across <.Values.replicas> pods using the built-in<br>autodiscovery feature: https://github.com/kubernetes/kube-state-metrics#automated-sharding<br>This is an experimental feature and there are no stability guarantees. | `bool` | `false` | no |
| <a name="input_kube_state_metrics_chart_name"></a> [kube\_state\_metrics\_chart\_name](#input\_kube\_state\_metrics\_chart\_name) | Helm chart name to provision | `string` | `"kube-state-metrics"` | no |
| <a name="input_kube_state_metrics_chart_namespace"></a> [kube\_state\_metrics\_chart\_namespace](#input\_kube\_state\_metrics\_chart\_namespace) | Namespace to install the chart into | `string` | `"default"` | no |
| <a name="input_kube_state_metrics_chart_repository"></a> [kube\_state\_metrics\_chart\_repository](#input\_kube\_state\_metrics\_chart\_repository) | Helm repository for the chart | `string` | `"https://prometheus-community.github.io/helm-charts"` | no |
| <a name="input_kube_state_metrics_chart_version"></a> [kube\_state\_metrics\_chart\_version](#input\_kube\_state\_metrics\_chart\_version) | Version of Chart to install. Set to empty to install the latest version | `string` | `""` | no |
| <a name="input_kube_state_metrics_collection_namespace"></a> [kube\_state\_metrics\_collection\_namespace](#input\_kube\_state\_metrics\_collection\_namespace) | Specific namespaces to collect metrics for | `string` | `""` | no |
| <a name="input_kube_state_metrics_collectors"></a> [kube\_state\_metrics\_collectors](#input\_kube\_state\_metrics\_collectors) | Collectors for Kube state metrics | `list` | <pre>[<br>  "certificatesigningrequests",<br>  "configmaps",<br>  "cronjobs",<br>  "daemonsets",<br>  "deployments",<br>  "endpoints",<br>  "horizontalpodautoscalers",<br>  "ingresses",<br>  "jobs",<br>  "limitranges",<br>  "mutatingwebhookconfigurations",<br>  "namespaces",<br>  "networkpolicies",<br>  "nodes",<br>  "persistentvolumeclaims",<br>  "persistentvolumes",<br>  "poddisruptionbudgets",<br>  "pods",<br>  "replicasets",<br>  "replicationcontrollers",<br>  "resourcequotas",<br>  "secrets",<br>  "services",<br>  "statefulsets",<br>  "storageclasses",<br>  "validatingwebhookconfigurations",<br>  "verticalpodautoscalers",<br>  "volumeattachments"<br>]</pre> | no |
| <a name="input_kube_state_metrics_container_security_context"></a> [kube\_state\_metrics\_container\_security\_context](#input\_kube\_state\_metrics\_container\_security\_context) | Security context for kube\_state\_metrics containers defined as a map which will be serialized to JSON. | `map` | `{}` | no |
| <a name="input_kube_state_metrics_enable"></a> [kube\_state\_metrics\_enable](#input\_kube\_state\_metrics\_enable) | Enable Kube State Metrics | `string` | `"true"` | no |
| <a name="input_kube_state_metrics_extra_args"></a> [kube\_state\_metrics\_extra\_args](#input\_kube\_state\_metrics\_extra\_args) | Extra arguments for Kube State Metrics container | `map` | `{}` | no |
| <a name="input_kube_state_metrics_extra_env"></a> [kube\_state\_metrics\_extra\_env](#input\_kube\_state\_metrics\_extra\_env) | Extra environment variables for Kube State Metrics container | `map` | `{}` | no |
| <a name="input_kube_state_metrics_host_network"></a> [kube\_state\_metrics\_host\_network](#input\_kube\_state\_metrics\_host\_network) | Use host network for KSM | `bool` | `false` | no |
| <a name="input_kube_state_metrics_labels"></a> [kube\_state\_metrics\_labels](#input\_kube\_state\_metrics\_labels) | Labels for Kube State Metrics | `map` | `{}` | no |
| <a name="input_kube_state_metrics_metric_allow_list"></a> [kube\_state\_metrics\_metric\_allow\_list](#input\_kube\_state\_metrics\_metric\_allow\_list) | This list of metrics to be exposed for KSM | `list` | `[]` | no |
| <a name="input_kube_state_metrics_metric_deny_list"></a> [kube\_state\_metrics\_metric\_deny\_list](#input\_kube\_state\_metrics\_metric\_deny\_list) | This list of metrics not to be enabled for KSM | `list` | `[]` | no |
| <a name="input_kube_state_metrics_metric_label_allow_list"></a> [kube\_state\_metrics\_metric\_label\_allow\_list](#input\_kube\_state\_metrics\_metric\_label\_allow\_list) | This list of additional Kubernetes label keys that will be used in the resource's lables metric | `list` | `[]` | no |
| <a name="input_kube_state_metrics_node_selector"></a> [kube\_state\_metrics\_node\_selector](#input\_kube\_state\_metrics\_node\_selector) | Node selector for Kube State Metrics pods | `map` | `{}` | no |
| <a name="input_kube_state_metrics_pdb"></a> [kube\_state\_metrics\_pdb](#input\_kube\_state\_metrics\_pdb) | PDB for Kubestatemetrics | `map` | <pre>{<br>  "maxUnavailable": 1<br>}</pre> | no |
| <a name="input_kube_state_metrics_pod_security_policy_additional_volumes"></a> [kube\_state\_metrics\_pod\_security\_policy\_additional\_volumes](#input\_kube\_state\_metrics\_pod\_security\_policy\_additional\_volumes) | PodSecurityPolicy additional volumes for Kube State Metrics | `list` | `[]` | no |
| <a name="input_kube_state_metrics_pod_security_policy_annotations"></a> [kube\_state\_metrics\_pod\_security\_policy\_annotations](#input\_kube\_state\_metrics\_pod\_security\_policy\_annotations) | PodSecurityPolicy annotations for Kube State Metrics | `map` | <pre>{<br>  "apparmor.security.beta.kubernetes.io/allowedProfileNames": "runtime/default",<br>  "apparmor.security.beta.kubernetes.io/defaultProfileName": "runtime/default"<br>}</pre> | no |
| <a name="input_kube_state_metrics_priority_class_name"></a> [kube\_state\_metrics\_priority\_class\_name](#input\_kube\_state\_metrics\_priority\_class\_name) | Priority Class Name for Kube State Metrics pods | `string` | `""` | no |
| <a name="input_kube_state_metrics_pull_policy"></a> [kube\_state\_metrics\_pull\_policy](#input\_kube\_state\_metrics\_pull\_policy) | Image pull policy for Kube State Metrics | `string` | `"IfNotPresent"` | no |
| <a name="input_kube_state_metrics_release_name"></a> [kube\_state\_metrics\_release\_name](#input\_kube\_state\_metrics\_release\_name) | Helm release name for Kube State Metrics | `string` | `"kube-state-metrics"` | no |
| <a name="input_kube_state_metrics_replica"></a> [kube\_state\_metrics\_replica](#input\_kube\_state\_metrics\_replica) | Number of replicas for Kube State Metrics | `number` | `1` | no |
| <a name="input_kube_state_metrics_repository"></a> [kube\_state\_metrics\_repository](#input\_kube\_state\_metrics\_repository) | Docker repository for Kube State Metrics | `string` | `"registry.k8s.io/kube-state-metrics/kube-state-metrics"` | no |
| <a name="input_kube_state_metrics_resources"></a> [kube\_state\_metrics\_resources](#input\_kube\_state\_metrics\_resources) | Resources for Kube State Metrics | `map` | `{}` | no |
| <a name="input_kube_state_metrics_security_context"></a> [kube\_state\_metrics\_security\_context](#input\_kube\_state\_metrics\_security\_context) | Security context for kube\_state\_metrics pods defined as a map which will be serialized to JSON. | `map` | <pre>{<br>  "enabled": true,<br>  "fsGroup": 65534,<br>  "runAsGroup": 65534,<br>  "runAsUser": 65534,<br>  "seccompProfile": {<br>    "type": "RuntimeDefault"<br>  }<br>}</pre> | no |
| <a name="input_kube_state_metrics_service_account"></a> [kube\_state\_metrics\_service\_account](#input\_kube\_state\_metrics\_service\_account) | Name of the service account for kubeStateMetrics. Defaults to component's fully qualified name. | `string` | `""` | no |
| <a name="input_kube_state_metrics_service_account_annotations"></a> [kube\_state\_metrics\_service\_account\_annotations](#input\_kube\_state\_metrics\_service\_account\_annotations) | Annotations for the service account | `map` | `{}` | no |
| <a name="input_kube_state_metrics_service_annotations"></a> [kube\_state\_metrics\_service\_annotations](#input\_kube\_state\_metrics\_service\_annotations) | Annotations for Kube State Metrics service | `map` | <pre>{<br>  "prometheus.io/scrape": "true"<br>}</pre> | no |
| <a name="input_kube_state_metrics_service_cluster_ip"></a> [kube\_state\_metrics\_service\_cluster\_ip](#input\_kube\_state\_metrics\_service\_cluster\_ip) | Cluster IP for Kube State Metrics Service | `string` | `"None"` | no |
| <a name="input_kube_state_metrics_service_lb_ip"></a> [kube\_state\_metrics\_service\_lb\_ip](#input\_kube\_state\_metrics\_service\_lb\_ip) | Load Balancer IP for Kube State Metrics service | `string` | `""` | no |
| <a name="input_kube_state_metrics_service_port"></a> [kube\_state\_metrics\_service\_port](#input\_kube\_state\_metrics\_service\_port) | Service port for Kube State Metrics | `number` | `80` | no |
| <a name="input_kube_state_metrics_service_type"></a> [kube\_state\_metrics\_service\_type](#input\_kube\_state\_metrics\_service\_type) | Type of service for Kube State Metrics | `string` | `"ClusterIP"` | no |
| <a name="input_kube_state_metrics_tag"></a> [kube\_state\_metrics\_tag](#input\_kube\_state\_metrics\_tag) | Tag for Kube State Metrics Docker Image | `string` | `"v2.1.0"` | no |
| <a name="input_kube_state_metrics_tolerations"></a> [kube\_state\_metrics\_tolerations](#input\_kube\_state\_metrics\_tolerations) | Tolerations for Kube State Metrics | `list` | `[]` | no |
| <a name="input_max_history"></a> [max\_history](#input\_max\_history) | Max History for Helm | `number` | `20` | no |
| <a name="input_node_exporter_affinity"></a> [node\_exporter\_affinity](#input\_node\_exporter\_affinity) | Affinity for node\_exporter pods | `map` | `{}` | no |
| <a name="input_node_exporter_annotations"></a> [node\_exporter\_annotations](#input\_node\_exporter\_annotations) | Annotations for Node Exporter pods | `map` | `{}` | no |
| <a name="input_node_exporter_chart_name"></a> [node\_exporter\_chart\_name](#input\_node\_exporter\_chart\_name) | Helm chart name to provision for Node Exporter | `string` | `"prometheus-node-exporter"` | no |
| <a name="input_node_exporter_chart_namespace"></a> [node\_exporter\_chart\_namespace](#input\_node\_exporter\_chart\_namespace) | Namespace to install the chart into | `string` | `"default"` | no |
| <a name="input_node_exporter_chart_repository"></a> [node\_exporter\_chart\_repository](#input\_node\_exporter\_chart\_repository) | Helm repository for the Node Exporter chart | `string` | `"https://prometheus-community.github.io/helm-charts"` | no |
| <a name="input_node_exporter_chart_version"></a> [node\_exporter\_chart\_version](#input\_node\_exporter\_chart\_version) | Version of Node Exporter Chart to install. Set to empty to install the latest version | `string` | `""` | no |
| <a name="input_node_exporter_config_map_mounts"></a> [node\_exporter\_config\_map\_mounts](#input\_node\_exporter\_config\_map\_mounts) | ConfigMap Mounts for Node Exporter | `list` | `[]` | no |
| <a name="input_node_exporter_enable"></a> [node\_exporter\_enable](#input\_node\_exporter\_enable) | Enable Node Exporter | `string` | `"true"` | no |
| <a name="input_node_exporter_enable_pod_security_policy"></a> [node\_exporter\_enable\_pod\_security\_policy](#input\_node\_exporter\_enable\_pod\_security\_policy) | Create PodSecurityPolicy for Node Exporter | `string` | `"false"` | no |
| <a name="input_node_exporter_extra_args"></a> [node\_exporter\_extra\_args](#input\_node\_exporter\_extra\_args) | Extra arguments for Node Exporter container | `map` | `{}` | no |
| <a name="input_node_exporter_host_network"></a> [node\_exporter\_host\_network](#input\_node\_exporter\_host\_network) | Use the Host network namespace for Node Exporter | `string` | `"true"` | no |
| <a name="input_node_exporter_host_path_mounts"></a> [node\_exporter\_host\_path\_mounts](#input\_node\_exporter\_host\_path\_mounts) | Host Path Mounts for Node Exporter | `list` | `[]` | no |
| <a name="input_node_exporter_labels"></a> [node\_exporter\_labels](#input\_node\_exporter\_labels) | Labels for Node Exporter | `map` | `{}` | no |
| <a name="input_node_exporter_node_selector"></a> [node\_exporter\_node\_selector](#input\_node\_exporter\_node\_selector) | Node selector for node\_exporter pods | `map` | `{}` | no |
| <a name="input_node_exporter_pod_security_policy_annotations"></a> [node\_exporter\_pod\_security\_policy\_annotations](#input\_node\_exporter\_pod\_security\_policy\_annotations) | PodSecurityPolicy annotations for Node exporter | `map` | <pre>{<br>  "apparmor.security.beta.kubernetes.io/allowedProfileNames": "runtime/default",<br>  "apparmor.security.beta.kubernetes.io/defaultProfileName": "runtime/default",<br>  "seccomp.security.alpha.kubernetes.io/allowedProfileNames": "docker/default,runtime/default",<br>  "seccomp.security.alpha.kubernetes.io/defaultProfileName": "runtime/default"<br>}</pre> | no |
| <a name="input_node_exporter_priority_class_name"></a> [node\_exporter\_priority\_class\_name](#input\_node\_exporter\_priority\_class\_name) | Priority Class Name for Node Exporter pods | `string` | `""` | no |
| <a name="input_node_exporter_pull_policy"></a> [node\_exporter\_pull\_policy](#input\_node\_exporter\_pull\_policy) | Image pull policy for Node Exporter | `string` | `"IfNotPresent"` | no |
| <a name="input_node_exporter_release_name"></a> [node\_exporter\_release\_name](#input\_node\_exporter\_release\_name) | Helm release name for Node Exporter | `string` | `"prometheus-node-exporter"` | no |
| <a name="input_node_exporter_repository"></a> [node\_exporter\_repository](#input\_node\_exporter\_repository) | Docker repository for Node Exporter | `string` | `"quay.io/prometheus/node-exporter"` | no |
| <a name="input_node_exporter_resources"></a> [node\_exporter\_resources](#input\_node\_exporter\_resources) | Resources for node\_exporter | `map` | `{}` | no |
| <a name="input_node_exporter_security_context"></a> [node\_exporter\_security\_context](#input\_node\_exporter\_security\_context) | Security context for node\_exporter pods defined as a map which will be serialized to JSON. | `map` | <pre>{<br>  "fsGroup": 65534,<br>  "runAsGroup": 65534,<br>  "runAsNonRoot": true,<br>  "runAsUser": 65534,<br>  "seccompProfile": {<br>    "type": "RuntimeDefault"<br>  },<br>  "supplementalGroups": [<br>    0<br>  ]<br>}</pre> | no |
| <a name="input_node_exporter_service_account"></a> [node\_exporter\_service\_account](#input\_node\_exporter\_service\_account) | Name of the service account for nodeExporter. Defaults to component's fully qualified name. | `string` | `""` | no |
| <a name="input_node_exporter_service_account_annotations"></a> [node\_exporter\_service\_account\_annotations](#input\_node\_exporter\_service\_account\_annotations) | Annotations for the service account | `map` | `{}` | no |
| <a name="input_node_exporter_service_annotations"></a> [node\_exporter\_service\_annotations](#input\_node\_exporter\_service\_annotations) | Annotations for Node Exporter service | `map` | <pre>{<br>  "prometheus.io/scrape": "true"<br>}</pre> | no |
| <a name="input_node_exporter_service_port"></a> [node\_exporter\_service\_port](#input\_node\_exporter\_service\_port) | Service port for Node Exporter | `number` | `9100` | no |
| <a name="input_node_exporter_service_type"></a> [node\_exporter\_service\_type](#input\_node\_exporter\_service\_type) | Type of service for Node Exporter | `string` | `"ClusterIP"` | no |
| <a name="input_node_exporter_tag"></a> [node\_exporter\_tag](#input\_node\_exporter\_tag) | Tag for Node Exporter Docker Image | `string` | `"v1.2.0"` | no |
| <a name="input_node_exporter_tolerations"></a> [node\_exporter\_tolerations](#input\_node\_exporter\_tolerations) | Tolerations for Node Exporter | `list` | `[]` | no |
| <a name="input_pod_security_policy_enable"></a> [pod\_security\_policy\_enable](#input\_pod\_security\_policy\_enable) | Create PodSecurityPolicy Resources | `bool` | `true` | no |
| <a name="input_prometheus_enable"></a> [prometheus\_enable](#input\_prometheus\_enable) | Enable Prometheus stack. Disable to use independent components like KSM and Node Exporter. | `bool` | `true` | no |
| <a name="input_prometheus_remote_read_api_url"></a> [prometheus\_remote\_read\_api\_url](#input\_prometheus\_remote\_read\_api\_url) | Prometheus remote read URL | `string` | `null` | no |
| <a name="input_prometheus_remote_write_api_url"></a> [prometheus\_remote\_write\_api\_url](#input\_prometheus\_remote\_write\_api\_url) | Prometheus remote write URL | `string` | `null` | no |
| <a name="input_pushgateway_annotations"></a> [pushgateway\_annotations](#input\_pushgateway\_annotations) | Annotations for Pushgateway pods | `map` | `{}` | no |
| <a name="input_pushgateway_deployment_annotations"></a> [pushgateway\_deployment\_annotations](#input\_pushgateway\_deployment\_annotations) | Annotations to be added to Pushgateway deployment | `map` | `{}` | no |
| <a name="input_pushgateway_enable"></a> [pushgateway\_enable](#input\_pushgateway\_enable) | Enable Pushgateway | `string` | `"true"` | no |
| <a name="input_pushgateway_extra_args"></a> [pushgateway\_extra\_args](#input\_pushgateway\_extra\_args) | Extra arguments for Pushgateway container | `map` | `{}` | no |
| <a name="input_pushgateway_extra_env"></a> [pushgateway\_extra\_env](#input\_pushgateway\_extra\_env) | Extra environment variables for Pushgateway container | `map` | `{}` | no |
| <a name="input_pushgateway_extra_init_containers"></a> [pushgateway\_extra\_init\_containers](#input\_pushgateway\_extra\_init\_containers) | Additional InitContainers to initialize the Pushgateway pod | `list` | `[]` | no |
| <a name="input_pushgateway_ingress_annotations"></a> [pushgateway\_ingress\_annotations](#input\_pushgateway\_ingress\_annotations) | Annotations for Pushgateway ingress | `map` | `{}` | no |
| <a name="input_pushgateway_ingress_enabled"></a> [pushgateway\_ingress\_enabled](#input\_pushgateway\_ingress\_enabled) | Enable ingress for Pushgateway | `string` | `"false"` | no |
| <a name="input_pushgateway_ingress_extra_labels"></a> [pushgateway\_ingress\_extra\_labels](#input\_pushgateway\_ingress\_extra\_labels) | Additional labels for Pushgateway ingress | `map` | `{}` | no |
| <a name="input_pushgateway_ingress_extra_paths"></a> [pushgateway\_ingress\_extra\_paths](#input\_pushgateway\_ingress\_extra\_paths) | Extra paths to prepend to every host configuration for Pushgateway ingress | `list` | `[]` | no |
| <a name="input_pushgateway_ingress_hosts"></a> [pushgateway\_ingress\_hosts](#input\_pushgateway\_ingress\_hosts) | List of Hosts for Pushgateway ingress | `list` | `[]` | no |
| <a name="input_pushgateway_ingress_path"></a> [pushgateway\_ingress\_path](#input\_pushgateway\_ingress\_path) | Path of Pushgateway ingress | `string` | `"/"` | no |
| <a name="input_pushgateway_ingress_tls"></a> [pushgateway\_ingress\_tls](#input\_pushgateway\_ingress\_tls) | TLS configurationf or Pushgateway ingress | `list` | `[]` | no |
| <a name="input_pushgateway_node_selector"></a> [pushgateway\_node\_selector](#input\_pushgateway\_node\_selector) | Node selector for pushgateway pods | `map` | `{}` | no |
| <a name="input_pushgateway_pdb_enable"></a> [pushgateway\_pdb\_enable](#input\_pushgateway\_pdb\_enable) | Enable PDB | `bool` | `true` | no |
| <a name="input_pushgateway_pdb_max_unavailable"></a> [pushgateway\_pdb\_max\_unavailable](#input\_pushgateway\_pdb\_max\_unavailable) | Max unavailable pods | `number` | `1` | no |
| <a name="input_pushgateway_pod_security_policy_annotations"></a> [pushgateway\_pod\_security\_policy\_annotations](#input\_pushgateway\_pod\_security\_policy\_annotations) | PodSecurityPolicy annotations for Pushgateway | `map` | <pre>{<br>  "apparmor.security.beta.kubernetes.io/allowedProfileNames": "runtime/default",<br>  "apparmor.security.beta.kubernetes.io/defaultProfileName": "runtime/default"<br>}</pre> | no |
| <a name="input_pushgateway_priority_class_name"></a> [pushgateway\_priority\_class\_name](#input\_pushgateway\_priority\_class\_name) | Priority Class Name for Pushgateway pods | `string` | `""` | no |
| <a name="input_pushgateway_pull_policy"></a> [pushgateway\_pull\_policy](#input\_pushgateway\_pull\_policy) | Image pull policy for Pushgateway | `string` | `"IfNotPresent"` | no |
| <a name="input_pushgateway_pv_access_modes"></a> [pushgateway\_pv\_access\_modes](#input\_pushgateway\_pv\_access\_modes) | pushgateway data Persistent Volume access modes | `list` | <pre>[<br>  "ReadWriteOnce"<br>]</pre> | no |
| <a name="input_pushgateway_pv_annotations"></a> [pushgateway\_pv\_annotations](#input\_pushgateway\_pv\_annotations) | Annotations for Pushgateway PV | `map` | `{}` | no |
| <a name="input_pushgateway_pv_enabled"></a> [pushgateway\_pv\_enabled](#input\_pushgateway\_pv\_enabled) | Enable persistent volume on Pushgateway | `string` | `"true"` | no |
| <a name="input_pushgateway_pv_existing_claim"></a> [pushgateway\_pv\_existing\_claim](#input\_pushgateway\_pv\_existing\_claim) | Use an existing PV claim for pushgateway | `string` | `""` | no |
| <a name="input_pushgateway_pv_size"></a> [pushgateway\_pv\_size](#input\_pushgateway\_pv\_size) | pushgateway data Persistent Volume size | `string` | `"2Gi"` | no |
| <a name="input_pushgateway_replica"></a> [pushgateway\_replica](#input\_pushgateway\_replica) | Number of replicas for pushgateway | `number` | `1` | no |
| <a name="input_pushgateway_repository"></a> [pushgateway\_repository](#input\_pushgateway\_repository) | Docker repository for Pushgateway | `string` | `"quay.io/prometheus/pushgateway"` | no |
| <a name="input_pushgateway_resources"></a> [pushgateway\_resources](#input\_pushgateway\_resources) | Resources for pushgateway | `map` | `{}` | no |
| <a name="input_pushgateway_security_context"></a> [pushgateway\_security\_context](#input\_pushgateway\_security\_context) | Security context for pushgateway pods defined as a map which will be serialized to JSON | `map` | <pre>{<br>  "runAsNonRoot": true,<br>  "runAsUser": 65534,<br>  "seccompProfile": {<br>    "type": "RuntimeDefault"<br>  }<br>}</pre> | no |
| <a name="input_pushgateway_service_account"></a> [pushgateway\_service\_account](#input\_pushgateway\_service\_account) | Name of the service account for pushgateway. Defaults to component's fully qualified name. | `string` | `""` | no |
| <a name="input_pushgateway_service_account_annotations"></a> [pushgateway\_service\_account\_annotations](#input\_pushgateway\_service\_account\_annotations) | Annotations for the service account | `map` | `{}` | no |
| <a name="input_pushgateway_service_annotations"></a> [pushgateway\_service\_annotations](#input\_pushgateway\_service\_annotations) | Annotations for Pushgateway service | `map` | <pre>{<br>  "prometheus.io/probe": "pushgateway"<br>}</pre> | no |
| <a name="input_pushgateway_service_cluster_ip"></a> [pushgateway\_service\_cluster\_ip](#input\_pushgateway\_service\_cluster\_ip) | Cluster IP for Pushgateway Service | `string` | `""` | no |
| <a name="input_pushgateway_service_external_ips"></a> [pushgateway\_service\_external\_ips](#input\_pushgateway\_service\_external\_ips) | External IPs for Pushgateway service | `list` | `[]` | no |
| <a name="input_pushgateway_service_labels"></a> [pushgateway\_service\_labels](#input\_pushgateway\_service\_labels) | Labels for Pushgateway service | `map` | `{}` | no |
| <a name="input_pushgateway_service_lb_ip"></a> [pushgateway\_service\_lb\_ip](#input\_pushgateway\_service\_lb\_ip) | Load Balancer IP for Pushgateway service | `string` | `""` | no |
| <a name="input_pushgateway_service_lb_source_ranges"></a> [pushgateway\_service\_lb\_source\_ranges](#input\_pushgateway\_service\_lb\_source\_ranges) | List of source CIDRs allowed to access the Pushgateway LB | `list` | `[]` | no |
| <a name="input_pushgateway_service_port"></a> [pushgateway\_service\_port](#input\_pushgateway\_service\_port) | Service port for Pushgateway | `number` | `9091` | no |
| <a name="input_pushgateway_service_type"></a> [pushgateway\_service\_type](#input\_pushgateway\_service\_type) | Type of service for Pushgateway | `string` | `"ClusterIP"` | no |
| <a name="input_pushgateway_tag"></a> [pushgateway\_tag](#input\_pushgateway\_tag) | Tag for Pushgateway Docker Image | `string` | `"v1.4.1"` | no |
| <a name="input_pushgateway_tolerations"></a> [pushgateway\_tolerations](#input\_pushgateway\_tolerations) | Tolerations for Pushgateway | `list` | `[]` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm release name for Prometheus | `string` | `"prometheus"` | no |
| <a name="input_scrape_drop_pod_containers_without_port"></a> [scrape\_drop\_pod\_containers\_without\_port](#input\_scrape\_drop\_pod\_containers\_without\_port) | For pod targets, Prometheus generates a target per pod per container per port. For containers without a port, it leave the target in without any port. Configure to drop these targets | `bool` | `false` | no |
| <a name="input_scrape_drop_service_pod_containers_without_port"></a> [scrape\_drop\_service\_pod\_containers\_without\_port](#input\_scrape\_drop\_service\_pod\_containers\_without\_port) | For service targets, Prometheus generates a target per service per pod per container per port. For containers without a port, it leave the target in without any port. Configure to drop these targets | `bool` | `false` | no |
| <a name="input_scrape_skip_apiserver_tls_verify"></a> [scrape\_skip\_apiserver\_tls\_verify](#input\_scrape\_skip\_apiserver\_tls\_verify) | Skip verifying TLS Certificate for Kubernetes Master Server Scrape target. Warning: This is insecure | `bool` | `false` | no |
| <a name="input_scrape_skip_nodes_tls_verify"></a> [scrape\_skip\_nodes\_tls\_verify](#input\_scrape\_skip\_nodes\_tls\_verify) | Skip verifying TLS Certificate for Kubernetes Nodes Scrape target. Warning: This is insecure | `bool` | `false` | no |
| <a name="input_server_additional_global"></a> [server\_additional\_global](#input\_server\_additional\_global) | YAML string for additional global configuration for Prometheus Server | `string` | `""` | no |
| <a name="input_server_affinity"></a> [server\_affinity](#input\_server\_affinity) | Affinity for server pods | `map` | `{}` | no |
| <a name="input_server_alert_managers_configs"></a> [server\_alert\_managers\_configs](#input\_server\_alert\_managers\_configs) | Prometheus AlertManager configuration | `list` | `[]` | no |
| <a name="input_server_alerts"></a> [server\_alerts](#input\_server\_alerts) | Prometheus server alerts entries in YAML. Ref: https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/ | `string` | `"[]\n# - name: Instances\n#   rules:\n#     - alert: InstanceDown\n#       expr: up == 0\n#       for: 5m\n#       labels:\n#         severity: page\n#       annotations:\n#         description: '{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 5 minutes.'\n#         summary: 'Instance {{ $labels.instance }} down'\n"` | no |
| <a name="input_server_annotations"></a> [server\_annotations](#input\_server\_annotations) | Annotations to be added to Prometheus server pods | `map` | `{}` | no |
| <a name="input_server_base_url"></a> [server\_base\_url](#input\_server\_base\_url) | External URL which can access alertmanager | `string` | `""` | no |
| <a name="input_server_config_override"></a> [server\_config\_override](#input\_server\_config\_override) | Overriding the Prometheus server config file in YAML | `string` | `""` | no |
| <a name="input_server_data_retention"></a> [server\_data\_retention](#input\_server\_data\_retention) | Prometheus data retention period (i.e 360h) | `string` | `""` | no |
| <a name="input_server_deployment_annotations"></a> [server\_deployment\_annotations](#input\_server\_deployment\_annotations) | Annotations to be added to server deployment | `map` | `{}` | no |
| <a name="input_server_emptydir_size_limit"></a> [server\_emptydir\_size\_limit](#input\_server\_emptydir\_size\_limit) | Prometheus server emptyDir volume size limit | `string` | `""` | no |
| <a name="input_server_enable"></a> [server\_enable](#input\_server\_enable) | Deploy Prometheus Server | `string` | `"true"` | no |
| <a name="input_server_enable_service_links"></a> [server\_enable\_service\_links](#input\_server\_enable\_service\_links) | EnableServiceLinks indicates whether information about services should be injected into pod's environment variables, matching the syntax of Docker links. | `bool` | `true` | no |
| <a name="input_server_evaluation_interval"></a> [server\_evaluation\_interval](#input\_server\_evaluation\_interval) | How frequently to evaluate rules | `string` | `"1m"` | no |
| <a name="input_server_extra_args"></a> [server\_extra\_args](#input\_server\_extra\_args) | Extra arguments for server container | `map` | `{}` | no |
| <a name="input_server_extra_configmap_mounts"></a> [server\_extra\_configmap\_mounts](#input\_server\_extra\_configmap\_mounts) | Additional Prometheus server ConfigMap mounts | `list` | `[]` | no |
| <a name="input_server_extra_env"></a> [server\_extra\_env](#input\_server\_extra\_env) | Extra environment variables for server container | `map` | `{}` | no |
| <a name="input_server_extra_flags"></a> [server\_extra\_flags](#input\_server\_extra\_flags) | Additional flags to control Prometheus server behaviour. | `list` | `[]` | no |
| <a name="input_server_extra_host_path_mounts"></a> [server\_extra\_host\_path\_mounts](#input\_server\_extra\_host\_path\_mounts) | Additional Prometheus server hostPath mounts | `list` | `[]` | no |
| <a name="input_server_extra_init_containers"></a> [server\_extra\_init\_containers](#input\_server\_extra\_init\_containers) | Additional InitContainers to initialize the pod | `list` | `[]` | no |
| <a name="input_server_extra_secret_mounts"></a> [server\_extra\_secret\_mounts](#input\_server\_extra\_secret\_mounts) | Extra secret mounts for server | `list` | `[]` | no |
| <a name="input_server_extra_volume_mounts"></a> [server\_extra\_volume\_mounts](#input\_server\_extra\_volume\_mounts) | Additional Prometheus server Volume mounts | `list` | `[]` | no |
| <a name="input_server_extra_volumes"></a> [server\_extra\_volumes](#input\_server\_extra\_volumes) | Additional Prometheus server Volumes | `list` | `[]` | no |
| <a name="input_server_headless_annotations"></a> [server\_headless\_annotations](#input\_server\_headless\_annotations) | Annotations for server StatefulSet headless service | `map` | `{}` | no |
| <a name="input_server_headless_grpc_enabled"></a> [server\_headless\_grpc\_enabled](#input\_server\_headless\_grpc\_enabled) | Enable gRPC port on service to allow auto discovery with thanos-querier | `bool` | `false` | no |
| <a name="input_server_headless_grpc_port"></a> [server\_headless\_grpc\_port](#input\_server\_headless\_grpc\_port) | gRPC servicePort for server headless service | `number` | `10901` | no |
| <a name="input_server_headless_labels"></a> [server\_headless\_labels](#input\_server\_headless\_labels) | Labels for server StatefulSet headless service | `map` | `{}` | no |
| <a name="input_server_host_aliases"></a> [server\_host\_aliases](#input\_server\_host\_aliases) | hostAliases allows adding entries to /etc/hosts inside the containers | `list` | `[]` | no |
| <a name="input_server_host_network_enabled"></a> [server\_host\_network\_enabled](#input\_server\_host\_network\_enabled) | Required for use in managed kubernetes clusters (such as AWS EKS) with custom CNI (such as calico), because control-plane managed by AWS cannot communicate with pods' IP CIDR and admission webhooks are not working | `bool` | `false` | no |
| <a name="input_server_ingress_annotations"></a> [server\_ingress\_annotations](#input\_server\_ingress\_annotations) | Annotations for server ingress | `map` | `{}` | no |
| <a name="input_server_ingress_enabled"></a> [server\_ingress\_enabled](#input\_server\_ingress\_enabled) | Enable ingress for server | `string` | `"false"` | no |
| <a name="input_server_ingress_extra_labels"></a> [server\_ingress\_extra\_labels](#input\_server\_ingress\_extra\_labels) | Additional labels for server ingress | `map` | `{}` | no |
| <a name="input_server_ingress_extra_paths"></a> [server\_ingress\_extra\_paths](#input\_server\_ingress\_extra\_paths) | Extra paths to prepend to every host configuration for server ingress | `list` | `[]` | no |
| <a name="input_server_ingress_hosts"></a> [server\_ingress\_hosts](#input\_server\_ingress\_hosts) | List of Hosts for server ingress | `list` | `[]` | no |
| <a name="input_server_ingress_path"></a> [server\_ingress\_path](#input\_server\_ingress\_path) | Path of server ingress | `string` | `"/"` | no |
| <a name="input_server_ingress_tls"></a> [server\_ingress\_tls](#input\_server\_ingress\_tls) | TLS configurationf or server ingress | `list` | `[]` | no |
| <a name="input_server_node_selector"></a> [server\_node\_selector](#input\_server\_node\_selector) | Node labels for Prometheus server pod assignment | `map` | `{}` | no |
| <a name="input_server_pdb_enable"></a> [server\_pdb\_enable](#input\_server\_pdb\_enable) | Enable PDB | `bool` | `true` | no |
| <a name="input_server_pdb_max_unavailable"></a> [server\_pdb\_max\_unavailable](#input\_server\_pdb\_max\_unavailable) | Max unavailable pods | `number` | `1` | no |
| <a name="input_server_pod_labels"></a> [server\_pod\_labels](#input\_server\_pod\_labels) | Labels to be added to Prometheus server pods | `map` | `{}` | no |
| <a name="input_server_pod_probes"></a> [server\_pod\_probes](#input\_server\_pod\_probes) | Prometheus server readiness and liveness probe initial delay and timeout | `map` | <pre>{<br>  "livenessProbeFailureThreshold": 3,<br>  "livenessProbeInitialDelay": 30,<br>  "livenessProbePeriodSeconds": 15,<br>  "livenessProbeSuccessThreshold": 1,<br>  "livenessProbeTimeout": 10,<br>  "readinessProbeFailureThreshold": 3,<br>  "readinessProbeInitialDelay": 30,<br>  "readinessProbePeriodSeconds": 5,<br>  "readinessProbeSuccessThreshold": 1,<br>  "readinessProbeTimeout": 10<br>}</pre> | no |
| <a name="input_server_pod_security_policy_annotations"></a> [server\_pod\_security\_policy\_annotations](#input\_server\_pod\_security\_policy\_annotations) | PodSecurityPolicy annotations for server | `map` | <pre>{<br>  "apparmor.security.beta.kubernetes.io/allowedProfileNames": "runtime/default",<br>  "apparmor.security.beta.kubernetes.io/defaultProfileName": "runtime/default"<br>}</pre> | no |
| <a name="input_server_prefix_url"></a> [server\_prefix\_url](#input\_server\_prefix\_url) | The URL prefix at which the container can be accessed. Useful in the case the '-web.external-url' includes a slug so that the various internal URLs are still able to access as they are in the default case. | `string` | `""` | no |
| <a name="input_server_priority_class_name"></a> [server\_priority\_class\_name](#input\_server\_priority\_class\_name) | Priority Class Name for server pods | `string` | `""` | no |
| <a name="input_server_pull_policy"></a> [server\_pull\_policy](#input\_server\_pull\_policy) | Image pull policy for server | `string` | `"IfNotPresent"` | no |
| <a name="input_server_pv_access_modes"></a> [server\_pv\_access\_modes](#input\_server\_pv\_access\_modes) | server data Persistent Volume access modes | `list` | <pre>[<br>  "ReadWriteOnce"<br>]</pre> | no |
| <a name="input_server_pv_annotations"></a> [server\_pv\_annotations](#input\_server\_pv\_annotations) | Annotations for server PV | `map` | `{}` | no |
| <a name="input_server_pv_enabled"></a> [server\_pv\_enabled](#input\_server\_pv\_enabled) | Enable persistent volume on server | `string` | `"true"` | no |
| <a name="input_server_pv_existing_claim"></a> [server\_pv\_existing\_claim](#input\_server\_pv\_existing\_claim) | Use an existing PV claim for server | `string` | `""` | no |
| <a name="input_server_pv_size"></a> [server\_pv\_size](#input\_server\_pv\_size) | server data Persistent Volume size | `string` | `"8Gi"` | no |
| <a name="input_server_replica"></a> [server\_replica](#input\_server\_replica) | Number of replicas for server | `number` | `1` | no |
| <a name="input_server_repository"></a> [server\_repository](#input\_server\_repository) | Docker repository for server | `string` | `"quay.io/prometheus/prometheus"` | no |
| <a name="input_server_resources"></a> [server\_resources](#input\_server\_resources) | Resources for server | `map` | `{}` | no |
| <a name="input_server_rules"></a> [server\_rules](#input\_server\_rules) | Prometheus server rules entries in YAML | `string` | `"[]\n# - name: k8s_health\n#   rules:\n#     - record: k8s_container_oom\n#       expr: increase(kube_pod_container_status_last_terminated_reason{reason=\"OOMKilled\"}[2m]) and on(pod) increase(kube_pod_container_status_restarts_total[2m])\n"` | no |
| <a name="input_server_scrape_interval"></a> [server\_scrape\_interval](#input\_server\_scrape\_interval) | How frequently to scrape targets by default | `string` | `"1m"` | no |
| <a name="input_server_scrape_timeout"></a> [server\_scrape\_timeout](#input\_server\_scrape\_timeout) | How long until a scrape request times out | `string` | `"10s"` | no |
| <a name="input_server_security_context"></a> [server\_security\_context](#input\_server\_security\_context) | Security context for server pods defined as a map which will be serialized to JSON | `map` | <pre>{<br>  "fsGroup": 65534,<br>  "runAsGroup": 65534,<br>  "runAsNonRoot": true,<br>  "runAsUser": 65534,<br>  "seccompProfile": {<br>    "type": "RuntimeDefault"<br>  }<br>}</pre> | no |
| <a name="input_server_service_account"></a> [server\_service\_account](#input\_server\_service\_account) | Name of the service account for server. Defaults to component's fully qualified name. | `string` | `""` | no |
| <a name="input_server_service_account_annotations"></a> [server\_service\_account\_annotations](#input\_server\_service\_account\_annotations) | Annotations for the service account | `map` | `{}` | no |
| <a name="input_server_service_annotations"></a> [server\_service\_annotations](#input\_server\_service\_annotations) | Annotations for server service | `map` | <pre>{<br>  "prometheus.io/probe": "server"<br>}</pre> | no |
| <a name="input_server_service_cluster_ip"></a> [server\_service\_cluster\_ip](#input\_server\_service\_cluster\_ip) | Cluster IP for server Service | `string` | `""` | no |
| <a name="input_server_service_external_ips"></a> [server\_service\_external\_ips](#input\_server\_service\_external\_ips) | External IPs for server service | `list` | `[]` | no |
| <a name="input_server_service_grpc_enabled"></a> [server\_service\_grpc\_enabled](#input\_server\_service\_grpc\_enabled) | Enable gRPC port on service to allow auto discovery with thanos-querier | `bool` | `false` | no |
| <a name="input_server_service_grpc_port"></a> [server\_service\_grpc\_port](#input\_server\_service\_grpc\_port) | gRPC servicePort for server service | `string` | `"10901"` | no |
| <a name="input_server_service_labels"></a> [server\_service\_labels](#input\_server\_service\_labels) | Labels for server service | `map` | `{}` | no |
| <a name="input_server_service_lb_ip"></a> [server\_service\_lb\_ip](#input\_server\_service\_lb\_ip) | Load Balancer IP for server service | `string` | `""` | no |
| <a name="input_server_service_lb_source_ranges"></a> [server\_service\_lb\_source\_ranges](#input\_server\_service\_lb\_source\_ranges) | List of source CIDRs allowed to access the server LB | `list` | `[]` | no |
| <a name="input_server_service_port"></a> [server\_service\_port](#input\_server\_service\_port) | Service port for Prometheus server | `number` | `9091` | no |
| <a name="input_server_service_session_affinity"></a> [server\_service\_session\_affinity](#input\_server\_service\_session\_affinity) | Service sessionAffinity for Prometheus server | `string` | `"None"` | no |
| <a name="input_server_service_type"></a> [server\_service\_type](#input\_server\_service\_type) | Type of service for Prometheus server | `string` | `"ClusterIP"` | no |
| <a name="input_server_sidecar_containers"></a> [server\_sidecar\_containers](#input\_server\_sidecar\_containers) | Sidecar containers for server | `list` | `[]` | no |
| <a name="input_server_statefulset_annotations"></a> [server\_statefulset\_annotations](#input\_server\_statefulset\_annotations) | Annotations to be added to server statefulSet | `map` | `{}` | no |
| <a name="input_server_statefulset_labels"></a> [server\_statefulset\_labels](#input\_server\_statefulset\_labels) | Labels to be added to Prometheus server statefulSet | `map` | `{}` | no |
| <a name="input_server_tag"></a> [server\_tag](#input\_server\_tag) | Tag for server Docker Image | `string` | `"v2.28.1"` | no |
| <a name="input_server_termination_grace_seconds"></a> [server\_termination\_grace\_seconds](#input\_server\_termination\_grace\_seconds) | Prometheus server pod termination grace period | `string` | `"300"` | no |
| <a name="input_server_tolerations"></a> [server\_tolerations](#input\_server\_tolerations) | Node tolerations for server scheduling to nodes with taints | `list` | `[]` | no |
| <a name="input_server_vpa_container_policies"></a> [server\_vpa\_container\_policies](#input\_server\_vpa\_container\_policies) | server VPA containerPolicies | `map` | `{}` | no |
| <a name="input_server_vpa_enabled"></a> [server\_vpa\_enabled](#input\_server\_vpa\_enabled) | If true a VPA object will be created for the controller (either StatefulSet or Deployemnt) | `bool` | `false` | no |
| <a name="input_server_vpa_update_mode"></a> [server\_vpa\_update\_mode](#input\_server\_vpa\_update\_mode) | server VPA updateMode | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_prometheus_alerts_api_url"></a> [prometheus\_alerts\_api\_url](#output\_prometheus\_alerts\_api\_url) | Prometheus query API URL: https://prometheus.io/docs/prometheus/latest/querying/api/#expression-queries |
| <a name="output_prometheus_query_api_url"></a> [prometheus\_query\_api\_url](#output\_prometheus\_query\_api\_url) | Prometheus query API URL: https://prometheus.io/docs/prometheus/latest/querying/api/#expression-queries |
