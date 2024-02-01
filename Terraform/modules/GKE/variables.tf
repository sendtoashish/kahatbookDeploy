variable "cluster_name"{
  type = string
}
variable "project_name"{
  type = string
}
variable "location"{
  type = string
}
variable "network"{
  type = string
}
variable "subnetwork"{
  type = string
}
variable "release_channel" {
  type        = string
  default     = null
}
variable "enable_shielded_nodes" {
  description = "Whether to enable shielded nodes"
  type        = bool
  default     = false
}
variable "enable_intranode_visibility" {
  description = "Whether to enable intranode visibility to add pod traffic to VPC flow logs"
  type        = bool
  default     = false
}
variable "kubernetes_version" {
  description = "The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region."
  type        = string
}
variable "subnetwork_secondary_range_name_pods" {
  type = string
}
variable "subnetwork_secondary_range_name_services"{
  type = string
}