output "cluster_id" {
  value = var.cluster_name
}

output "console_url" {
  value = "https://console-openshift-console.apps.${var.cluster_name}.${var.environment}.example.com"
}

output "api_endpoint" {
  value = "https://api.${var.cluster_name}.${var.environment}.example.com:6443"
}