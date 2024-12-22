output "prometheus_query_api_url" {
  description = "Prometheus query API URL: https://prometheus.io/docs/prometheus/latest/querying/api/#expression-queries"
  value       = local.prometheus_query_api_url
}

output "prometheus_alerts_api_url" {
  description = "Prometheus query API URL: https://prometheus.io/docs/prometheus/latest/querying/api/#expression-queries"
  value       = local.prometheus_alerts_api_url
}
