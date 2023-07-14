provider "google" {
  project = var.project_id
  region  = var.region
  credentials = var.credentials
}
resource "google_project_service" "enable_dataproc_api" {
  project = var.project_id
  service = "dataproc.googleapis.com"
}
resource "google_project_service" "enable_dataflow_api" {
  project = var.project_id
  service = "dataflow.googleapis.com"
}
resource "google_project_service" "enable_kubernetes_api" {
  project = var.project_id
  service = "container.googleapis.com"
}
resource "google_project_service" "enable_cloud_storage_api" {
  project = var.project_id
  service = "storage-component.googleapis.com"
}
resource "google_project_service" "enable_composer_api" {
  project = var.project_id
  service = "composer.googleapis.com"
}
resource "google_project_service" "enable_artifactregistry_api" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"
}
resource "google_project_service" "enable_compute_api" {
  project = var.project_id
  service = "compute.googleapis.com"
}
resource "google_project_service" "enable_datastream_api" {
  project = var.project_id
  service = "datastream.googleapis.com"
}

