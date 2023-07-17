
resource "google_composer_environment" "composer" {
  name   = var.composer_name
  region = var.region
  config {
# Configuartion used to make Airflow Web UI accessible from subnet range only
    web_server_network_access_control {
      allowed_ip_range {
# Subnet Range mentione below.
        value = var.allow_ip_range
        description = "Access to Airflow Web UI from Subnet Range Only"
      }

    }
   private_environment_config {
    enable_private_endpoint = true
# GKE control plane range.
    master_ipv4_cidr_block = var.master_authorized_networks.cidr_block
    }

    software_config {
      image_version = "composer-2-airflow-2"
    }
    
    encryption_config {
# KMS key 
    kms_key_name = "projects/prj-srv-data-lake-prod/locations/asia-south1/keyRings/hdfc-ergo-poc/cryptoKeys/hdfc-ergo-poc-key"
    }

    environment_size = "ENVIRONMENT_SIZE_SMALL"

    node_config {
      network    = var.terraform_vpc.name
      subnetwork = var.composer_subnet.name
      service_account = var.google_service_account.composer_sa.email
        enable_ip_masq_agent = false
      ip_allocation_policy {
        cluster_ipv4_cidr_block       = "192.168.0.0/22"
        cluster_secondary_range_name  = "composer-pod-cidr"
        services_ipv4_cidr_block      = "192.168.4.0/24"
        services_secondary_range_name = "composer-service-cidr"
        use_ip_aliases                =  true
        }
      
    }
    workloads_config {
      scheduler {
        cpu        = 0.5
        memory_gb  = 1.875
        storage_gb = 1
        count      = 1
      }
      web_server {
        cpu        = 0.5
        memory_gb  = 1.875
        storage_gb = 1
      }
      worker {
        cpu = 0.5
        memory_gb  = 1.875
        storage_gb = 1
        min_count  = 1
        max_count  = 3
      }


    }
    
    
  }
}
