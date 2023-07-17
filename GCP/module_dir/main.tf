module "vpc" {
    source = "../vpc"
}

module "sa" {
    source = "../service-account"
     
}

module "kms" {
    source = "../kms"
  
}

module "compose-autopilot" {
    source = "../composer-autopilot"
    composer_vpc = var.vpc_network_name
    composer_subnetwork = var.subnetwork_composer
    composer_service_account = var.composer_sa
  
}