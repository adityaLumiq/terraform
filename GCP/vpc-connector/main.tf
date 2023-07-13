resource "google_project_service" "vpcaccess_api" {
  service = "vpcaccess.googleapis.com"
  provider = google-beta
  disable_on_destroy = false
}

# VPC
resource "google_compute_network" "vpc-network" {
  name = var.vpc_network_name
  provider = google-beta
  auto_create_subnetworks = false
}

# VPC access connector
resource "google_vpc_access_connector" "connector" {
  name = var.vpc-connector
  provider = google-beta
  region = var.region
  ip_cidr_range = "10.8.0.0/28"
  max_throughput = 300
  network = google_compute_network.vpc-network.name
  depends_on = [google_project_service.vpcaccess_api]
}

# Cloud Router
resource "google_compute_router" "router" {
  name = var.router-name
  provider = google-beta
  region = var.region
  network = google_compute_network.vpc-network.name
}

# NAT configuration
resource "google_compute_router_nat" "nat" {
  name = var.nat
  provider = google-beta
  region = var.region
  router = google_compute_router.router.name
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ip_allocate_option = "AUTO_ONLY"
}
