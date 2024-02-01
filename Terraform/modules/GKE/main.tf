resource "google_container_cluster" "cluster" {
  name                        = var.cluster_name
  project                     = var.project_name
  location                    = var.location
  network                     = var.network
  subnetwork                  = var.subnetwork
  min_master_version          = var.release_channel == null ? local.kubernetes_version : null
  remove_default_node_pool    = false
  initial_node_count          = 1
  enable_shielded_nodes       = var.enable_shielded_nodes
  enable_intranode_visibility = var.enable_intranode_visibility
  release_channel {
    channel = var.release_channel == null ?"UNSPECIFIED" : var.release_channel
  }
  ip_allocation_policy {
    // Choose the range, but let GCP pick the IPs within the range
    cluster_secondary_range_name  = var.subnetwork_secondary_range_name_pods
    services_secondary_range_name = var.subnetwork_secondary_range_name_services
  }
}
locals {
  latest_version     = data.google_container_engine_versions.location.latest_master_version
  kubernetes_version = var.kubernetes_version != "latest" ? var.kubernetes_version : local.latest_version
}

data "google_container_engine_versions" "location" {
  location = var.location
  project  = var.project_name
}