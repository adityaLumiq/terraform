
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
      image_version = var.image_version
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
        cpu        = var.scheduler.cpu
        memory_gb  = var.scheduler.memory_gb
        storage_gb = var.scheduler.storage_gb
        count      = var.scheduler.count
      }
      web_server {
        cpu        = var.web_server.cpu
        memory_gb  = var.web_server.memory_gb
        storage_gb = var.web_server.storage_gb
      }
      worker {
        cpu = var.worker.cpu
        memory_gb  = var.worker.memory_gb
        storage_gb = var.worker.storage_gb
        min_count  = var.worker.min_count
        max_count  = var.worker.max_count
      }


    }
    
    
  }
}
