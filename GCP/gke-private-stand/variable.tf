# main.tf

variable "project_id" {
  description = "Google Cloud project ID"
}

variable "cluster_name" {
  description = "GKE cluster name"
}

variable "region" {
  description = "GCP region"
}

variable "network" {
  description = "VPC network name"
}

variable "subnetwork" {
  description = "Subnetwork name"
}

variable "cluster_ipv4_cidr" {
  description = "IP range for the GKE cluster"
}

provider "google" {
  project = var.project_id
  region  = var.region
}