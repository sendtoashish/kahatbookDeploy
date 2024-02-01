output "vpc_network" {
  value = google_compute_network.vpc_network.name
}
output "network-secondary-ip-ranges-id_pod"{
  value = google_compute_subnetwork.subnet.secondary_ip_range[0].ip_cidr_range
}
output "network-secondary-ip-range-id_service"{
  value = google_compute_subnetwork.subnet.secondary_ip_range[1].ip_cidr_range
}
output "subnetwork_name" {
  value = google_compute_subnetwork.subnet.name
}