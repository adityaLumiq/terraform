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
    master_ipv4_cidr_block = var.master_authorized_networks[0].cidr_block
    }

    software_config {
      image_version = var.image_version
    }
    
    encryption_config {
# KMS key 
    kms_key_name = var.kms_key_name
    }

    environment_size = var.environment_size

    node_config {
      
      network    = var.composer_vpc
      subnetwork = var.composer_subnet
      service_account = var.composer_sa

      enable_ip_masq_agent = false
      ip_allocation_policy {
        cluster_ipv4_cidr_block       = var.ip_pods.cidr_block
        cluster_secondary_range_name  = var.ip_pods.display_name
        services_ipv4_cidr_block      = var.ip_svc.cidr_block
        services_secondary_range_name = var.ip_svc.display_name
        #use_ip_aliases                =  true
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
