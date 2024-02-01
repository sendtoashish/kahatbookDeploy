output "vpc_network" {
  value = google_compute_network.vpc_network.name
}
output "network-secondary-ip-ranges-id_pod"{
  value = google_compute_subnetwork.network-secondary-ip-ranges[0].ip_cidr_range
}
output "network-secondary-ip-range-id_service"{
  value = google_compute_subnetwork.network-secondary-ip-ranges[1].ip_cidr_range
}
output "subnetwork_name" {
  value = google_compute_subnetwork.network-secondary-ip-ranges.name
}