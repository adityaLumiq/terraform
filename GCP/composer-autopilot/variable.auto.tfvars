composer_name = "terraform_composer"
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
master_authorized_networks = [ {
  cidr_block = "10.3.0.0/28"
  display_name = "composer-cidr"
} ]
allow_ip_range = "10.54.2.0/24"
ip_pod = [ {
  cidr_block = "192.168.0.0/16"
  display_name = "composer-pod-range"
} ]
ip_svc = [ {
  cidr_block = "192.168.4.0/16"
  display_name = "composer-svc-range"
} ]