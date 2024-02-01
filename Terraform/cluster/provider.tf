provider "google"{
  project = var.project_name
  region = var.region_name
  credentials = file(var.gcp_credential)
}