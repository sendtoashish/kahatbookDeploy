terraform{
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~>3.67.0"
    }
  }
}
module "vpc"{
  source = "../modules/vpcm"
  project-name = var.project_name
  name = var.vpc_name
}

module "gke_cluster"{
  source                                   = "../modules/GKE"
  cluster_name                             = var.cluster_name
  project_name                             = var.project_name
  location                                 = var.location
  network                                  = module.vpc.vpc_network
  subnetwork_secondary_range_name_pods     = module.vpc.network-secondary-ip-ranges-id_pod
  subnetwork_secondary_range_name_services = module.vpc.network-secondary-ip-range-id_service
  kubernetes_version                       = var.release_channel == null ? var.kubernetes_version : null
  release_channel                          = var.release_channel
  subnetwork                               = module.vpc.subnetwork_name
  enable_shielded_nodes                    = true
  disable_public_endpoint                  = false
  enable_intranode_visibility              = true
  workload_identity_config                 = true
  config_connector                         = true
  gce_persistent_disk_csi_driver_config    = true


}


