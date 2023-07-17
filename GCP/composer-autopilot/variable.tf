variable "composer_name" {
    type = string
    description = "Name of the composer"
  
}

variable "region" {
    type = string
    description = "Region in which composer to be created"
  
}

variable "image_version" {
    type = string
    description = "Airflow Image to be used"
  
}
variable "environment_size" {
  type        = string
  description = "Environment size"
  default     = "ENVIRONMENT_SIZE_SMALL"
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
variable "master_authorized_networks" {
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default     = []
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
}

variable "allow_ip_range" {
  type = string
  description = "Subnet to access Airlflow UI"
  
}

variable "ip_pods" {
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  description = "Pod Ranges"

}

variable "ip_svc" {
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  description = "Svc Ranges"
}

variable "selected_vpc_index" {
  type    = number
  default = 0  # Change this index to 1 if you want to use the second VPC.
}

variable "selected_vpc_subnetwork_index" {
  type    = number
  default = 1  # Change this index to 1 if you want to use the second VPC.
}

variable "selected_kms_index" {
  type    = number
  default = 0  # Change this index to 1 if you want to use the second VPC.
}

variable "selected_sa_index" {
  type = number
  default = 0 #Change this index to 1 if you want to use the second VPC
  
}