locals {
  prometheus_server_url = var.prometheus_enable ? "http://${helm_release.prometheus[0].metadata[0].name}-server.${helm_release.prometheus[0].metadata[0].namespace}.svc.cluster.local:${var.server_service_port}" : ""

  prometheus_query_api_url  = var.prometheus_remote_read_api_url != null && var.prometheus_remote_read_api_url != "" ? var.prometheus_remote_read_api_url : local.prometheus_server_url
  prometheus_alerts_api_url = local.prometheus_server_url

  server_extra_flags = distinct(concat(var.server_extra_flags, ["web.enable-lifecycle"]))

  self_scrape_config = [
    {
      job_name = "prometheus"
      static_configs = [
        {
          targets = ["localhost:9090"]
        }
      ]
    }
  ]

  scrape_config_values = {
    scrape_skip_apiserver_tls_verify = var.scrape_skip_apiserver_tls_verify
    scrape_skip_nodes_tls_verify     = var.scrape_skip_nodes_tls_verify

    drop_service_pod_containers_without_port = var.scrape_drop_service_pod_containers_without_port
    drop_pod_containers_without_port         = var.scrape_drop_pod_containers_without_port
  }
}
