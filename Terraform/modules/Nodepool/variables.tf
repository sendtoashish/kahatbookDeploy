# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------
variable "project" {
  description = "The project ID to host the cluster in"
  type        = string
}

variable "location" {
  description = "The location (region or zone) to host the cluster in"
  type        = string
}

variable "gke_node_pool" {
  description = "GKE cluster node pool name"
  type        = string
}

variable "gke_cluster_name" {
  description = "The name of the cluster"
  type        = string
}

variable "node_count" {
  description = "The node count in the pool when not using autoscaling"
  type        = number
  default     = null
}

variable "initial_node_count" {
  description = "The initial node count in the pool"
  type        = number
}

variable "autoscaling" {
  description = "Whether to use autoscaling or not"
  type        = bool
  default     = true
}

variable "auto_scaling_min_node_count" {
  description = "Auto scaling min node count"
  type        = number
  default     = null
}

variable "auto_scaling_max_node_count" {
  description = "Auto scaling max node count"
  type        = number
  default     = null
}

variable "gke_node_pool_service_account" {
  description = "Node pool service account"
  type        = string
}

variable "gke_node_pool_labels" {
  description = "Labels that needs to be applyed to the pool"
  type        = map
}
# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------
variable "auto_repair" {
  description = "Whether the nodes will be automatically repaired."
  type        = bool
  default     = true
}

variable "auto_upgrade" {
  description = "Whether the nodes will be automatically upgraded"
  type        = bool
  default     = false
}

variable "gke_node_pool_version" {
  description = "The Kubernetes version for the nodes in this pool. Note that if this field and auto_upgrade are both specified, they will fight each other for what the node version should be, so setting both is highly discouraged."
  type        = string
  default     = ""
}

variable "node_pool_disk_size" {
  description = "node pool disk size"
  type        = number
  default     = 30
}

variable "node_pool_disk_type" {
  description = "Type of disk values: pd-standard, pd-ssd"
  type        = string
  default     = "pd-standard"
}

variable "node_pool_preemptible" {
  description = "If the node pool should be preemptible"
  type        = bool
  default     = false
}

variable "gke_node_pool_machine_type" {
  description = "node pool machine types get a list of valid values by running `cloud compute machine-types list --filter=\"zone~'europe-west4'\" --sort-by name,zone`"
  type        = string
  default     = "n1-standard-1"
}

variable "gke_node_pool_image_type" {
  description = "GKE image type values are COS or UBUNTU"
  type        = string
  default     = "COS"
}

variable "max_surge" {
  description = "The number of additional nodes that can be added to the node pool during an upgrade."
  type        = number
  default     = 2
}

variable "max_unavailable" {
  description = " The number of nodes that can be simultaneously unavailable during an upgrade"
  type        = number
  default     = 1
}

variable "enable_secure_boot" {
  description = "Whether to enable secure boot, disabled by default"
  type        = bool
  default     = false
}

variable "enable_integrity_monitoring" {
  description = "Whether to enable integrity monitoring, enabled by default"
  type        = bool
  default     = true
}

variable "workload_metadata_config" {
  description = "Specify type of workload metadata config to put on cluster"
  type        = string
  default     = null
}

variable "gke_node_pool_tags" {
  description = "Tags that needs to be applied to the pool"
  type        = list(string)
  default     = []
}

