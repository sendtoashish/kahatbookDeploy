variable "gcp_credential"{
  type = string
  default = "/home/sendtoashish123/terroform-credential.json"
}
variable "project_name"{
  description = "The project ID where all resources will be launched."
  type = string
}
variable "region_name"{
  type = string
}
variable "vpc_name"{
  type = string
}
variable "sub-name"{
  type =  string
}
variable "public_subnetwork"{
  type = string
}
variable "location" {
  description = "The location (region or zone) of the GKE cluster. If you specify a zone your cluster will be zonal."
  type        = string
}

variable "kubernetes_version" {
  description = "The kubernetes version to be installed"
  type        = string
  default     = ""
}
variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
}
variable release_channel {
  type    = string
  default = null
}