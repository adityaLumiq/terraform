resource "google_container_cluster" "private_cluster" {
  name               = var.cluster_name
  location           = var.region
  remove_default_node_pool = true

  network            = google_compute_network.private_network.self_link
  subnetwork         = google_compute_subnetwork.private_subnetwork.self_link

  private_cluster_config {
    enable_private_endpoint  = true
    enable_private_nodes     = true
    master_ipv4_cidr_block   = var.cluster_ipv4_cidr
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

data "google_compute_network" "private_network" {
  name = var.network
}

data "google_compute_subnetwork" "private_subnetwork" {
  name          = var.subnetwork
  network       = data.google_compute_network.private_network.self_link
  region        = var.region
}
