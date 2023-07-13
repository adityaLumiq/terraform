resource "google_compute_network" "vpc-network" {
name = var.vpc_network_name
auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "public-subnetwork" {
name = var.subnetwork
ip_cidr_range = "10.2.0.0/16"
  region = var.region
  network = google_compute_network.vpc-network.name
  }

  resource "google_compute_network" "vpc_network01" {
  name = var.vpc_network_name02
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "private-subnetwork" {
  name = var.subnetwork02
  ip_cidr_range = "10.3.0.0/16"
  region = var.region
  network = google_compute_network.vpc_network01.name
}