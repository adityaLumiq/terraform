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


resource "google_compute_instance" "vm_instance" {
  name = var.instance
  machine_type = "e2-medium"
  zone = var.zone_name
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  network_interface {
    network = google_compute_network.vpc-network.name
    subnetwork = google_compute_subnetwork.public-subnetwork.name
  }
  
}