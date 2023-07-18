module "vpc" {
    source = "./vpc"
    region = var.region
    zone = var.zone
    vpc_network_name = var.vpc_network_name
    subnetwork_composer = var.subnetwork_composer
    ip_range_composer = var.ip_range_composer
    subnetwork_other = var.subnetwork_other
    ip_range_other = var.ip_range_other
    ip_range_vpc = var.ip_range_vpc
    # composer_pods = var.composer_pods
    # composer_service = var.composer_service

}

module "service_account" {
    source = "./service-account"
    composer_sa = var.composer_sa
    other_sa = var.other_sa
    project_id = var.project_id
}

module "kms" {
    source = "./kms"
    keyring_name = var.keyring_name
    region = var.region
    key_name = var.kms_key_name
    rotation_period = var.rotation_period
    algorithm = var.algorithm
    project = var.project
}

module "composer" {
    source = "./composer-autopilot"
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
    composer_sa = var.composer_sa



  
}