variable "composer_name" {
    type = string
    description = "Name of the composer"
  
}

variable "region" {
    type = string
    description = "Region in which composer to be created"
  
}

variable "allow_ip_range" {
  type = string
  description = "Subnet to access Airlflow UI"
  
}

variable "master_authorized_networks" {
  type = object({
    cidr_block   = string
    display_name = string
  })
  
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
}

variable "image_version" {
    type = string
    description = "Airflow Image to be used"
  
}

variable "kms_key_name" {
  type = string
  description = "KMS Key to be used"
  
}

variable "environment_size" {
  type        = string
  description = "Environment size"
  default     = "ENVIRONMENT_SIZE_SMALL"
}

variable "composer_vpc" {
  type = string
  description = "Composer VPC"
  
}

variable "composer_subnet" {
  type = string
  description = "Composer Subnet"
  
}

variable "composer_sa" {
  type = string
  description = "Composer Service Account"
  
}

variable "ip_pods" {
  type = object({
    cidr_block   = string
    display_name = string
  })
  description = "Pod Ranges"

}

variable "ip_svc" {
  type = object({
    cidr_block   = string
    display_name = string
  })
  description = "Svc Ranges"
}


variable "scheduler" {
  type = object({
    cpu        = string
    memory_gb  = number
    storage_gb = number
    count      = number
  })
  default = {
    cpu        = 2
    memory_gb  = 7.5
    storage_gb = 5
    count      = 2
  }
  description = "Configuration for resources used by Airflow schedulers."
}

variable "web_server" {
  type = object({
    cpu        = string
    memory_gb  = number
    storage_gb = number
  })
  default = {
    cpu        = 2
    memory_gb  = 7.5
    storage_gb = 5
  }
  description = "Configuration for resources used by Airflow web server."
}

variable "worker" {
  type = object({
    cpu        = string
    memory_gb  = number
    storage_gb = number
    min_count  = number
    max_count  = number
  })
  default = {
    cpu        = 2
    memory_gb  = 7.5
    storage_gb = 5
    min_count  = 2
    max_count  = 6
  }
  description = "Configuration for resources used by Airflow workers."
}