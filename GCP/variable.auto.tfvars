composer_name = "terraform-composer"
region = "asia-south1"
image_version = "composer-2.3.3-airflow-2.4.3"
environment_size = "ENVIRONMENT_SIZE_SMALL"
scheduler = {
  cpu        = 2
  memory_gb  = 7.5
  storage_gb = 5
  count      = 2
}
web_server = {
  cpu = "2"
  memory_gb  = 7.5
  storage_gb = 5
}
worker = {
  cpu        = 2
  memory_gb  = 7.5
  storage_gb = 5
  min_count  = 2
  max_count  = 6
}
master_authorized_networks =  {
  cidr_block = "10.3.0.0/28"
  display_name = "composer-cidr"
} 
allow_ip_range = "10.54.2.0/24"
ip_pods =  {
  cidr_block = "192.168.0.0/16"
  display_name = "composer-pod-range"
} 
ip_svc =  {
  cidr_block = "192.168.4.0/16"
  display_name = "composer-svc-range"
} 


#kms
keyring_name  = "terraform_composer_keyring_test"
kms_key_name = "terraform_composer_key_test"
rotation_period = "2592000s" 
algorithm = "GOOGLE_SYMMETRIC_ENCRYPTION" 
project = "outstanding-pen-389306"

#vpc
zone = "asia-south1c"
vpc_network_name = "terraform-composer"
subnetwork_composer = "composer-subnet"
ip_range_composer = "10.54.2.0/24"
subnetwork_other = "app-subnet"
ip_range_other = "10.54.1.0/24"
ip_range_vpc = "10.0.0.0/24"
composer_pods = "172.16.0.0/16"
composer_service = "172.17.0.0/16"

#sa
composer_sa = "terraform-composer-sa"
other_sa = "terraform-other-sa"
project_id = "outstanding-pen-389306"