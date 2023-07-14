resource "google_compute_network" "terraform_vpc" {
  name = var.vpc_network_name
  
}

resource "google_compute_subnetwork" "composer_subnet" {
  name = var.subnetwork_composer
  ip_cidr_range = var.ip_range_composer
  region = var.region
  private_ip_google_access = var.private_google_access
  network = google_compute_network.terraform_vpc.name
  
}

resource "google_compute_subnetwork" "app_subnet" {
  name = var.subnetwork_other
  ip_cidr_range = var.ip_range_other
  region = var.region
  private_ip_google_access = var.private_google_access
  network = google_compute_network.terraform_vpc.name
  
}