resource "google_project_service" "vpcaccess_api" {
  service = "vpcaccess.googleapis.com"
  provider = google-beta
  disable_on_destroy = false
}

# VPC
resource "google_compute_network" "vpc-network" {
  name  = var.vpc_network_name
  provider = google-beta
  auto_create_subnetworks = false
}

# VPC access connector
resource "google_vpc_access_connector" "connector" {
  name          = var.vpc-connector
  provider      = google-beta
  region        = var.region
  ip_cidr_range = "10.8.0.0/28"
  max_throughput= 300
  network       = google_compute_network.vpc-network.name
  depends_on    = [google_project_service.vpcaccess_api]
}

# Cloud Run service
resource "google_cloud_run_service" "gcr_service" {
  name     = var.cloud-run
  provider = google-beta
  location = var.region

  template {
    spec {
      containers {
        image = "asia-docker.pkg.dev/cloudrun/container/hello"
        resources {
          limits = {
            cpu = "1000m"
            memory = "512M"
          }
        }
      }
      # the service uses this SA to call other Google Cloud APIs
      # service_account_name = myservice_runtime_sa
    }

    //metadata {
      //annotations = {
        # Limit scale up to prevent any cost blow outs!
        //"autoscaling.knative.dev/maxScale" = "5"
        //# Use the VPC Connector
        //"run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
        //# all egress from the service should go through the VPC Connector
        //"run.googleapis.com/vpc-access-egress" = "all-traffic"
      //}
    //}
  }
  autogenerate_revision_name = true
}