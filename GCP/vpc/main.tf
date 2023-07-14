resource "google_compute_network" "terraform_vpc" {
  name = var.vpc_network_name
  ip_cidr_range = var.ip_cidr_range
  region = var.region
  
}

resource "google_compute_subnetwork" "composer_subnet" {
  ip_cip_cidr_range = var.ip_range_composer
  region = var.region
  private_ip_google_access = var.private_google_access
  network = google_compute_network.terraform_vpc.name
  secondary_ip_range {
    range_name = composer_pods
    ip_cidr_range = var.composer_pods
  }
  secondary_ip_range {
    range_name = composer_service
    ip_cidr_range = var.composer_service
  }

  
}

resource "google_compute_subnetwork" "app_subnet" {
  ip_cidr_range = var.ip_range_other
  region = var.region
  private_ip_google_access = var.private_google_access
  network = google_compute_network.terraform_vpc.name
  
}