resource "helm_release" "node_exporter" {
  count = var.node_exporter_enable ? 1 : 0

  name       = var.node_exporter_release_name
  chart      = var.node_exporter_chart_name
  repository = var.node_exporter_chart_repository
  version    = var.node_exporter_chart_version
  namespace  = var.node_exporter_chart_namespace

  max_history = var.max_history

  values = [
    templatefile("${path.module}/templates/node_exporter.yaml", local.node_exporter_values),
  ]
}


locals {
  node_exporter_values = {
    host_network = var.node_exporter_host_network

    repository  = var.node_exporter_repository
    tag         = var.node_exporter_tag
    pull_policy = var.node_exporter_pull_policy

    pod_security_policy_enable      = var.pod_security_policy_enable
    pod_security_policy_annotations = jsonencode(var.node_exporter_pod_security_policy_annotations)

    resources = jsonencode(var.node_exporter_resources)

    annotations   = jsonencode(var.node_exporter_annotations)
    tolerations   = jsonencode(var.node_exporter_tolerations)
    labels        = jsonencode(var.node_exporter_labels)
    node_selector = jsonencode(var.node_exporter_node_selector)
    affinity      = jsonencode(var.node_exporter_affinity)

    service_account             = var.node_exporter_service_account
    service_account_annotations = jsonencode(var.node_exporter_service_account_annotations)

    security_context = jsonencode(var.node_exporter_security_context)

    host_path_mounts  = jsonencode(var.node_exporter_host_path_mounts)
    config_map_mounts = jsonencode(var.node_exporter_config_map_mounts)

    priority_class_name = var.node_exporter_priority_class_name
    extra_args          = jsonencode(var.node_exporter_extra_args)

    service_annotations = jsonencode(var.node_exporter_service_annotations)
    service_port        = var.node_exporter_service_port
    service_type        = var.node_exporter_service_type
  }
}
