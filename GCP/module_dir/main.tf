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
  
}