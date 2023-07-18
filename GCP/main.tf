module "vpc" {
    source = "vpc"
      
}

module "service_account" {
    source = "service-account"
  
}

module "kms" {
    source = "kms"
  
}

module "composer" {
    depends_on = [ module.kms, 
    module.service_account, 
    module.vpc 
    ]
    composer_name = var.composer_name
    region = var.region
    allow_ip_range = var.allow_ip_range
    master_authorized_networks = var.master_authorized_networks
    image_version = var.image_version
    kms_key_name = var.kms_key_name
    environment_size = var.environment_size
    composer_vpc = var.vpc_network_name
    composer_subnet = var.subnetwork_composer
    ip_pods = var.ip_pods
    ip_svc = var.ip_svc
    scheduler = var.scheduler
    web_server = var.web_server
    worker = var.worker
    


  
}