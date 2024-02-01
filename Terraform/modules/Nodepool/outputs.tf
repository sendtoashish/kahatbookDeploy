output "name" {
  description = "The name of the node pool"
  value       = google_container_node_pool.gke_node_pool.name
}

output "node_pool_version" {
  description = "The name of the node pool"
  value       = google_container_node_pool.gke_node_pool.version
}