module "vpc" {
    source = "./vpc"
}

module "sa" {
    source = "./service-account"
     
}

module "kms" {
    source = "./kms"
  
}

module "compose-autopilot" {
    source = "./composer-autopilot"
    composer_name = var.composer_name
    region = var.region
    image_version = var.image_version
    environment_size = var.environment_size
    scheduler = var.scheduler
    web_server = var.web_server
    worker = var.worker
    master_authorized_networks = var.master_authorized_networks
    allow_ip_range = var.allow_ip_range
    ip_pods = var.ip_pods
    ip_svc = var.ip_svc
    kms = var.key_name
    composer_vpc = var.composer_vpc
    composer_subnetwork = var.composer_subnetwork
    composer_service_account = var.composer_service_account
}