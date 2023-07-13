module "private_gke_cluster" {
  source      = "/home/lumiq/Desktop/Terraform/GCP/gke-private-stand"
  project_id  = "outstanding-pen-389306"
  cluster_name = "new-cluster"
  region      = "asia-south1"
  network     = "new-vpc"
  subnetwork  = "new-subnet"
  cluster_ipv4_cidr = "10.0.0.0/14"
}
