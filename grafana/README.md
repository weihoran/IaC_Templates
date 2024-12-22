# Grafana

Deploys Grafana and some supporting services on a Kubernetes cluster.

This module makes use of the [community](https://github.com/grafana/helm-charts/tree/main/charts/grafana) chart.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_affinity"></a> [affinity](#input\_affinity) | Pod affinity | `map(any)` | `{}` | no |
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Deployment annotations | `map(any)` | `{}` | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Helm chart name to provision | `string` | `"grafana"` | no |
| <a name="input_chart_namespace"></a> [chart\_namespace](#input\_chart\_namespace) | Namespace to install the chart into | `string` | `"default"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | Helm repository for the chart | `string` | `"https://grafana.github.io/helm-charts"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of Chart to install. Set to empty to install the latest version | `string` | `"6.16.6"` | no |
| <a name="input_command"></a> [command](#input\_command) | Define command to be executed at startup by grafana container | `list(any)` | `[]` | no |
| <a name="input_dashboard_providers"></a> [dashboard\_providers](#input\_dashboard\_providers) | YAML string to configure grafana dashboard providersref: http://docs.grafana.org/administration/provisioning/#dashboards `path` must be /var/lib/grafana/dashboards/<provider\_name> | `string` | `""` | no |
| <a name="input_dashboards"></a> [dashboards](#input\_dashboards) | YAML string to configure grafana dashboard to import | `string` | `""` | no |
| <a name="input_dashboards_config_maps"></a> [dashboards\_config\_maps](#input\_dashboards\_config\_maps) | Reference to external ConfigMap per provider. Use provider name as key and ConfiMap name as value. YAML string | `string` | `""` | no |
| <a name="input_datasources"></a> [datasources](#input\_datasources) | YAML string to configure grafana datasources http://docs.grafana.org/administration/provisioning/#datasources | `string` | `""` | no |
| <a name="input_enable_service_links"></a> [enable\_service\_links](#input\_enable\_service\_links) | Inject Kubernetes services as environment variables. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | Extra environment variables that will be pass onto deployment pods | `map(any)` | `{}` | no |
| <a name="input_env_from_secret"></a> [env\_from\_secret](#input\_env\_from\_secret) | The name of a secret in the same kubernetes namespace which contain values to be added to the environment | `string` | `""` | no |
| <a name="input_extra_configmap_mounts"></a> [extra\_configmap\_mounts](#input\_extra\_configmap\_mounts) | Extra ConfigMap to mount into the Container | `list(any)` | `[]` | no |
| <a name="input_extra_containers"></a> [extra\_containers](#input\_extra\_containers) | YAML string for extra containers | `string` | `""` | no |
| <a name="input_extra_empty_dir_mounts"></a> [extra\_empty\_dir\_mounts](#input\_extra\_empty\_dir\_mounts) | Extra Empty DIRs to mount into the Container | `list(any)` | `[]` | no |
| <a name="input_extra_init_containers"></a> [extra\_init\_containers](#input\_extra\_init\_containers) | Extra init containers | `list(any)` | `[]` | no |
| <a name="input_extra_secret_mounts"></a> [extra\_secret\_mounts](#input\_extra\_secret\_mounts) | Additional grafana server secret mounts | `list(any)` | `[]` | no |
| <a name="input_extra_volume_mounts"></a> [extra\_volume\_mounts](#input\_extra\_volume\_mounts) | Additional grafana server volume mounts | `list(any)` | `[]` | no |
| <a name="input_image"></a> [image](#input\_image) | Docker Image for Grafana | `string` | `"grafana/grafana"` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | Image Pull Policy for Grafana | `string` | `"IfNotPresent"` | no |
| <a name="input_image_renderer_annotations"></a> [image\_renderer\_annotations](#input\_image\_renderer\_annotations) | image-renderer deployment annotations | `map(any)` | `{}` | no |
| <a name="input_image_renderer_enabled"></a> [image\_renderer\_enabled](#input\_image\_renderer\_enabled) | Enable the image-renderer deployment and service | `bool` | `true` | no |
| <a name="input_image_renderer_env"></a> [image\_renderer\_env](#input\_image\_renderer\_env) | image-renderer extra environment variables | `map(any)` | <pre>{<br>  "HTTP_HOST": "0.0.0.0"<br>}</pre> | no |
| <a name="input_image_renderer_image_repository"></a> [image\_renderer\_image\_repository](#input\_image\_renderer\_image\_repository) | image-renderer Image repository | `string` | `"grafana/grafana-image-renderer"` | no |
| <a name="input_image_renderer_image_tag"></a> [image\_renderer\_image\_tag](#input\_image\_renderer\_image\_tag) | image-renderer Image tag | `string` | `"latest"` | no |
| <a name="input_image_renderer_pod_annotations"></a> [image\_renderer\_pod\_annotations](#input\_image\_renderer\_pod\_annotations) | image-renderer pod annotations | `map(any)` | `{}` | no |
| <a name="input_image_renderer_port"></a> [image\_renderer\_port](#input\_image\_renderer\_port) | image-renderer service port used by both service and deployment | `string` | `"8081"` | no |
| <a name="input_image_renderer_priority_class_name"></a> [image\_renderer\_priority\_class\_name](#input\_image\_renderer\_priority\_class\_name) | image-renderer deployment priority class | `string` | `""` | no |
| <a name="input_image_renderer_replicas"></a> [image\_renderer\_replicas](#input\_image\_renderer\_replicas) | Number of replicas of image-renderer to run | `number` | `1` | no |
| <a name="input_image_renderer_resources"></a> [image\_renderer\_resources](#input\_image\_renderer\_resources) | Resources for image-renderer container | `map(any)` | `{}` | no |
| <a name="input_image_renderer_security_context"></a> [image\_renderer\_security\_context](#input\_image\_renderer\_security\_context) | image-renderer deployment securityContext | `map(any)` | `{}` | no |
| <a name="input_image_renderer_service_account"></a> [image\_renderer\_service\_account](#input\_image\_renderer\_service\_account) | image-renderer deployment serviceAccount | `string` | `""` | no |
| <a name="input_image_renderer_target_port"></a> [image\_renderer\_target\_port](#input\_image\_renderer\_target\_port) | image-renderer service targetPort used by both service and deployment | `string` | `"8081"` | no |
| <a name="input_ingress_annotations"></a> [ingress\_annotations](#input\_ingress\_annotations) | Annotations for ingress | `map(any)` | `{}` | no |
| <a name="input_ingress_enabled"></a> [ingress\_enabled](#input\_ingress\_enabled) | Enable Ingress | `bool` | `false` | no |
| <a name="input_ingress_hosts"></a> [ingress\_hosts](#input\_ingress\_hosts) | Hosts for ingress | `list(any)` | `[]` | no |
| <a name="input_ingress_labels"></a> [ingress\_labels](#input\_ingress\_labels) | Labels for ingress | `map(any)` | `{}` | no |
| <a name="input_ingress_tls"></a> [ingress\_tls](#input\_ingress\_tls) | TLS configuration for ingress | `list(any)` | `[]` | no |
| <a name="input_init_chown_data_enabled"></a> [init\_chown\_data\_enabled](#input\_init\_chown\_data\_enabled) | Enable the Chown init container | `bool` | `true` | no |
| <a name="input_init_chown_data_resources"></a> [init\_chown\_data\_resources](#input\_init\_chown\_data\_resources) | Resources for the Chown init container | `map(any)` | `{}` | no |
| <a name="input_ldap_config"></a> [ldap\_config](#input\_ldap\_config) | String with contents for LDAP configuration in TOML | `string` | `""` | no |
| <a name="input_ldap_existing_secret"></a> [ldap\_existing\_secret](#input\_ldap\_existing\_secret) | Use an existing secret for LDAP config | `string` | `""` | no |
| <a name="input_main_config"></a> [main\_config](#input\_main\_config) | Main Config file in YAML | `string` | `"paths:\n  data: /var/lib/grafana/data\n  logs: /var/log/grafana\n  plugins: /var/lib/grafana/plugins\n  provisioning: /etc/grafana/provisioning\nanalytics:\n  check_for_updates: true\nlog:\n  mode: console\ngrafana_net:\n  url: https://grafana.netn"` | no |
| <a name="input_max_history"></a> [max\_history](#input\_max\_history) | Max history for Helm | `number` | `20` | no |
| <a name="input_node_selector"></a> [node\_selector](#input\_node\_selector) | Node selector for Pods | `map(any)` | `{}` | no |
| <a name="input_notifiers"></a> [notifiers](#input\_notifiers) | YAML string to configure notifiers http://docs.grafana.org/administration/provisioning/#alert-notification-channels | `string` | `""` | no |
| <a name="input_pdb"></a> [pdb](#input\_pdb) | PodDisruptionBudget for Grafana | `map(any)` | <pre>{<br>  "minAvailable": 1<br>}</pre> | no |
| <a name="input_persistence_annotations"></a> [persistence\_annotations](#input\_persistence\_annotations) | Annotations for the PV | `map(any)` | `{}` | no |
| <a name="input_persistence_enabled"></a> [persistence\_enabled](#input\_persistence\_enabled) | Enable PV | `bool` | `false` | no |
| <a name="input_persistence_existing_claim"></a> [persistence\_existing\_claim](#input\_persistence\_existing\_claim) | Use an existing PVC | `string` | `""` | no |
| <a name="input_persistence_size"></a> [persistence\_size](#input\_persistence\_size) | Size of the PV | `string` | `"10Gi"` | no |
| <a name="input_persistence_storage_class_name"></a> [persistence\_storage\_class\_name](#input\_persistence\_storage\_class\_name) | Storage Class name for the PV | `string` | `"default"` | no |
| <a name="input_plugins"></a> [plugins](#input\_plugins) | List of plugins to install | `list` | `[]` | no |
| <a name="input_pod_annotations"></a> [pod\_annotations](#input\_pod\_annotations) | Pod annotations | `map(any)` | `{}` | no |
| <a name="input_priority_class_name"></a> [priority\_class\_name](#input\_priority\_class\_name) | Priority Class name for Grafana | `string` | `""` | no |
| <a name="input_psp_enable"></a> [psp\_enable](#input\_psp\_enable) | Enable PSP | `bool` | `true` | no |
| <a name="input_psp_use_app_armor"></a> [psp\_use\_app\_armor](#input\_psp\_use\_app\_armor) | Use AppAmor in the PSP | `bool` | `true` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm release name for Grafana | `string` | `"grafana"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replicas of Grafana to run | `number` | `1` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Resources for Grafana container | `map(any)` | `{}` | no |
| <a name="input_security_context"></a> [security\_context](#input\_security\_context) | Security context for pods defined as a map which will be serialized to JSON. | `map(any)` | <pre>{<br>  "fsGroup": 472,<br>  "runAsGroup": 472,<br>  "runAsUser": 472<br>}</pre> | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Name of the Service Account for Grafana | `string` | `""` | no |
| <a name="input_service_account_annotations"></a> [service\_account\_annotations](#input\_service\_account\_annotations) | Annotations for service account | `map(any)` | `{}` | no |
| <a name="input_service_annotations"></a> [service\_annotations](#input\_service\_annotations) | Annotations for the service | `map(any)` | `{}` | no |
| <a name="input_service_labels"></a> [service\_labels](#input\_service\_labels) | Labels for the service | `map(any)` | `{}` | no |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | Port of the service | `string` | `"80"` | no |
| <a name="input_service_target_port"></a> [service\_target\_port](#input\_service\_target\_port) | Port in container to expose service | `string` | `"3000"` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | Service type | `string` | `"ClusterIP"` | no |
| <a name="input_smtp_existing_secret"></a> [smtp\_existing\_secret](#input\_smtp\_existing\_secret) | Existing secret containing the SMTP credentials | `string` | `""` | no |
| <a name="input_smtp_password_key"></a> [smtp\_password\_key](#input\_smtp\_password\_key) | Key in the secret containing the SMTP password | `string` | `"password"` | no |
| <a name="input_smtp_user_key"></a> [smtp\_user\_key](#input\_smtp\_user\_key) | Key in the secret containing the SMTP username | `string` | `"user"` | no |
| <a name="input_tag"></a> [tag](#input\_tag) | Docker Image tag for Grafana | `string` | `"8.1.2"` | no |
| <a name="input_tolerations"></a> [tolerations](#input\_tolerations) | Tolerations for pods | `list(any)` | `[]` | no |

## Outputs

No outputs.
