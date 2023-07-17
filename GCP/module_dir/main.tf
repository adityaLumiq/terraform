module "vpc" {
    source = "GCP/vpc"
}

module "sa" {
    source = "GCP/service-account"
     
}

module "kms" {
    source = "GCP/kms"
  
}

module "compose-autopilot" {
    source = "../composer-autopilot"
    composer_vpc = var.vpc_network_name
    composer_subnetwork = var.subnetwork_composer
    composer_service_account = var.composer_sa
  
}