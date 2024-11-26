output "cluster_id" {
  description = "ID do cluster OpenShift"
  value       = module.openshift.cluster_id
}

output "console_url" {
  description = "URL do console OpenShift"
  value       = module.openshift.console_url
}

output "api_endpoint" {
  description = "API endpoint do cluster"
  value       = module.openshift.api_endpoint
}