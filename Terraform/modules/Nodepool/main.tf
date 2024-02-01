# ---------------------------------------------------------------------------------------------------------------------
# Create the GKE Cluster node pool
# ------------------------------------------

resource "google_container_node_pool" "gke_node_pool" {
  provider = google-beta

  name     = var.gke_node_pool
  project  = var.project
  location = var.location
  cluster  = var.gke_cluster_name

  initial_node_count = var.autoscaling == true ? var.initial_node_count : null
  node_count         = var.autoscaling == true ? null : var.node_count

  dynamic "autoscaling" {
    for_each = var.autoscaling == true ? [1] : []
    content {
      min_node_count = var.auto_scaling_min_node_count
      max_node_count = var.auto_scaling_max_node_count
    }
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  version = var.gke_node_pool_version

  node_config {
    image_type   = var.gke_node_pool_image_type
    machine_type = var.gke_node_pool_machine_type

    labels          = var.gke_node_pool_labels
    tags            = var.gke_node_pool_tags
    disk_size_gb    = var.node_pool_disk_size
    disk_type       = var.node_pool_disk_type
    preemptible     = var.node_pool_preemptible
    service_account = var.gke_node_pool_service_account

    metadata = {
      disable-legacy-endpoints = true
    }


    shielded_instance_config {
      enable_secure_boot          = var.enable_secure_boot
      enable_integrity_monitoring = var.enable_integrity_monitoring
    }
    dynamic "workload_metadata_config" {
      for_each = var.workload_metadata_config != null ? [1] : []
      content {
        node_metadata = var.workload_metadata_config
      }
    }
  }

  lifecycle {
    ignore_changes = [initial_node_count]
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }

  upgrade_settings {
    max_surge       = var.max_surge
    max_unavailable = var.max_unavailable
  }
}