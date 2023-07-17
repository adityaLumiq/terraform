data "terraform_remote_state" "vpc_id" {
  backend = "local"  # If you are using a remote backend, specify it here (e.g., "gcs" for Google Cloud Storage).
  config = {
    path = "../vpc/terraform.tfstate"  # Path to the .tfstate file generated by VPC script.
  }
}

data "terraform_remote_state" "kms_key" {
  backend = "local"  # If you are using a remote backend, specify it here (e.g., "gcs" for Google Cloud Storage).
  config = {
    path = "../kms/terraform.tfstate"  # Path to the .tfstate file generated by VPC script.
  }
}

data "terraform_remote_state" "sa" {
  backend = "local"  # If you are using a remote backend, specify it here (e.g., "gcs" for Google Cloud Storage).
  config = {
    path = "../service-account/terraform.tfstate"  # Path to the .tfstate file generated by VPC script.
  }
  
}

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
    kms_key_name = data.terraform_remote_state.kms_key.outputs.kms_key[var.selected_kms_index]
    }

    environment_size = "ENVIRONMENT_SIZE_SMALL"

    node_config {
      #network    = data.terraform_remote_state.vpc_id.outputs.vpc_id[var.selected_vpc_index]
      network    = element(data.terraform_remote_state.vpc_id.outputs.vpc_id, var.selected_vpc_index)
      subnetwork = data.terraform_remote_state.vpc_id.outputs.vpc_id[var.selected_vpc_subnetwork_index]
      service_account = data.terraform_remote_state.sa.outputs.service_account[var.selected_sa_index]
      
        enable_ip_masq_agent = false
      ip_allocation_policy {
        cluster_ipv4_cidr_block       = var.ip_pods[0].cidr_block
        cluster_secondary_range_name  = var.ip_pods[0].display_name
        services_ipv4_cidr_block      = var.ip_svc[0].cidr_block
        services_secondary_range_name = var.ip_svc[0].display_name
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
