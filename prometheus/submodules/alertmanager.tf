resource "helm_release" "alertmanager" {
  count = var.alertmanager_enable ? 1 : 0

  name       = var.alertmanager_release_name
  chart      = var.alertmanager_chart_name
  repository = var.alertmanager_chart_repository
  version    = var.alertmanager_chart_version
  namespace  = var.alertmanager_chart_namespace

  max_history = var.max_history

  values = [
    templatefile("${path.module}/templates/alertmanager.yaml", local.alertmanager_values),
  ]
}

locals {
  alertmanager_values = {
    repository  = var.alertmanager_repository
    tag         = var.alertmanager_tag
    pull_policy = var.alertmanager_pull_policy

    replica   = var.alertmanager_replica
    resources = jsonencode(var.alertmanager_resources)

    service_account             = var.alertmanager_service_account
    service_account_annotations = jsonencode(var.alertmanager_service_account_annotations)

    statefulset_annotations = jsonencode(var.alertmanager_statefulset_annotations)
    annotations             = jsonencode(var.alertmanager_annotations)
    tolerations             = jsonencode(var.alertmanager_tolerations)
    node_selector           = jsonencode(var.alertmanager_node_selector)
    affinity                = jsonencode(var.alertmanager_affinity)

    security_context           = jsonencode(var.alertmanager_security_context)
    container_security_context = jsonencode(var.alertmanager_container_security_context)

    extra_args = jsonencode(var.alertmanager_extra_args)

    service_annotations = jsonencode(var.alertmanager_service_annotations)
    service_port        = var.alertmanager_service_port
    service_type        = var.alertmanager_service_type

    ingress_enabled     = var.alertmanager_ingress_enabled
    ingress_annotations = jsonencode(var.alertmanager_ingress_annotations)
    ingress_hosts       = jsonencode(var.alertmanager_ingress_hosts)
    ingress_tls         = jsonencode(var.alertmanager_ingress_tls)

    pv_enabled      = var.alertmanager_pv_enabled
    pv_access_modes = jsonencode(var.alertmanager_pv_access_modes)
    pv_size         = var.alertmanager_pv_size
    storage_class   = var.alertmanager_storage_class

    pdb = jsonencode(var.alertmanager_pdb)

    config = indent(2, var.alertmanager_config)

    configmap_name              = var.configmap_name
    configmap_image_repo        = var.configmap_image_repo
    configmap_image_tag         = var.configmap_image_tag
    configmap_image_pull_policy = var.configmap_pull_policy
    configmap_resources         = jsonencode(var.configmap_resources)
  }
}
