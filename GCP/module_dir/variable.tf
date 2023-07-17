# #########################################
# ########### CLOUD RUN ###################
# #########################################

# variable "project_name" {
#     type = string
#     description = "Name of the project"
# }

# variable "project_id" {
#     type = string
#     description = "Project ID"
# }

# variable "region" {
#     type = string
#     description = "asia-south1"
# }

# variable "zone" {
#     type = string
#     description = "asia-south1-c"
  
# }

# variable "instance" {
#     type = string
#     description = "Name of Instance"
# }

# variable "subnetwork" {
#     type = string
#     description = "Name of Subnetwork"
# }

# variable "vpc_network_name" {
#     type = string
#     description = "Giving a name for vpc network"
# }

# variable "service_account" {
#     type = string
#     description = "Name of Service Account"
  
# }

# variable "zone_name" {
#     type = string
#     description = "Name of Zone"
  
# }

# variable "vpc-connector" {
#     type = string
#     description = "Name of Connector"
# }

# variable "router-name" {
#     type = string
#     description = "Name of Router"
# }

# variable "nat" {
#     type = string
#     description = "Name of NAT"
# }

# variable "cloud-run" {
#     type = string
#     description = "Name of Cloud-Run"
# }

# #########################################
# ########### COMPOSER AUTOPILOT ##########
# #########################################

# variable "composer_name" {
#     type = string
#     description = "Name of the composer"
  
# }

# variable "region" {
#     type = string
#     description = "Region in which composer to be created"
  
# }

# variable "image_version" {
#     type = string
#     description = "Airflow Image to be used"
  
# }
# variable "environment_size" {
#   type        = string
#   description = "Environment size"
#   default     = "ENVIRONMENT_SIZE_SMALL"
# }
# variable "scheduler" {
#   type = object({
#     cpu        = string
#     memory_gb  = number
#     storage_gb = number
#     count      = number
#   })
#   default = {
#     cpu        = 2
#     memory_gb  = 7.5
#     storage_gb = 5
#     count      = 2
#   }
#   description = "Configuration for resources used by Airflow schedulers."
# }

# variable "web_server" {
#   type = object({
#     cpu        = string
#     memory_gb  = number
#     storage_gb = number
#   })
#   default = {
#     cpu        = 2
#     memory_gb  = 7.5
#     storage_gb = 5
#   }
#   description = "Configuration for resources used by Airflow web server."
# }

# variable "worker" {
#   type = object({
#     cpu        = string
#     memory_gb  = number
#     storage_gb = number
#     min_count  = number
#     max_count  = number
#   })
#   default = {
#     cpu        = 2
#     memory_gb  = 7.5
#     storage_gb = 5
#     min_count  = 2
#     max_count  = 6
#   }
#   description = "Configuration for resources used by Airflow workers."
# }
# variable "master_authorized_networks" {
#   type = list(object({
#     cidr_block   = string
#     display_name = string
#   }))
#   default     = []
#   description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
# }

# variable "allow_ip_range" {
#   type = string
#   description = "Subnet to access Airlflow UI"
  
# }

# variable "ip_pods" {
#   type = list(object({
#     cidr_block   = string
#     display_name = string
#   }))
#   description = "Pod Ranges"

# }

# variable "ip_svc" {
#   type = list(object({
#     cidr_block   = string
#     display_name = string
#   }))
#   description = "Svc Ranges"
# }


# #########################################
# ########### COMPUTE ENGINE ##############
# #########################################



# variable "project_name" {
#     type = string
#     description = "Name of the project"
# }

# variable "project_id" {
#     type = string
#     description = "Project ID"
# }

# variable "region" {
#     type = string
#     description = "asia-south1"
# }

# variable "zone" {
#     type = string
#     description = "asia-south1-c"
  
# }

# variable "instance" {
#     type = string
#     description = "Name of Instance"
# }

# variable "subnetwork" {
#     type = string
#     description = "Name of Subnetwork"
# }

# variable "vpc_network_name" {
#     type = string
#     description = "Giving a name for vpc network"
# }

# variable "service_account" {
#     type = string
#     description = "Name of Service Account"
  
# }

# variable "zone_name" {
#     type = string
#     description = "Name of Zone"
  
# }


# #########################################
# ########### ENABLE APIS #################
# #########################################
# variable "project_id" {
#   description = "Project ID where Cloud Composer Environment is created."
#   type        = string
#   default     = "outstanding-pen-389306"
# }
# variable "region" {
#   description = "Region where the Cloud Composer Environment is created."
#   type        = string
#   default     = "asia-south1"
# }


# #########################################
# ########## GKE PRIVATE STAND ############
# #########################################
# variable "project_id" {
#   description = "Google Cloud project ID"
# }

# variable "cluster_name" {
#   description = "GKE cluster name"
# }

# variable "region" {
#   description = "GCP region"
# }

# variable "network" {
#   description = "VPC network name"
# }

# variable "subnetwork" {
#   description = "Subnetwork name"
# }

# variable "cluster_ipv4_cidr" {
#   description = "IP range for the GKE cluster"
# }

# provider "google" {
#   project = var.project_id
#   region  = var.region
# }

# #########################################
# ################### KMS #################
# #########################################


# variable "key_name" {
#   description = "Name of the KMS key"
#   type = string
# }
# variable "keyring_name" {
#   description = "Name of the KMS Keyring"
#   type = string
# }
# variable "algorithm" {
#   description = "Algorithm for the KMS key"
#   type = string
# }
# variable "region" {
#   description = "Region for the KMS key"
#   type = string
# }
# variable "rotation_period" {
#   description = "Time in seconds to rotate key"
#   type = string
# }
# variable "project" {
#   description = "Project id"
#   type = string
# }

# #########################################
# ########### LOGS SINK #################
# #########################################

# variable "project_name" {
#     type = string
#     description = "Name of the project"
# }

# variable "project_id" {
#     type = string
#     description = "Project ID"
# }

# variable "region" {
#     type = string
#     description = "asia-south1"
# }

# variable "zone" {
#     type = string
#     description = "asia-south1-c" 
# }

# variable "big_query_dataset" {
#     type = string
#     description = "name of big query"
# }

# variable "logs_sink" {
#     type = string
#     description = "name sink"
  
# }

#########################################
################### VPC #################
#########################################

variable "region" {
    type = string
    description = "asia-south1"
}

variable "zone" {
    type = string
    description = "asia-south1-c"
  
}

variable "vpc_network_name" {
    type = string
    description = "VPC Network Name"
  
}

variable "ip_range_vpc" {
    type = string
    description = "CIDR Range for VPC"
  
}

variable "subnetwork_composer" {
    type = string
    description = "Subnetwork Name"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}

variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}

variable "ip_range_composer" {
    type = string
    description = "Composer Subnet"
}

variable "subnetwork_other" {
    type = string
    description = "Subnetwork other than Composer"
}

variable "ip_range_other" {
    type = string
    description = "Other Subnet"
}

variable "subnet_flow_logs" {
    type = bool
    default = true
    description = "Enable/Disable Flow Logs"
  
}

variable "private_google_access" {
    type = bool
    default = true
    description = "Enable/Disable Private Google APIs access"
  
}

variable "composer_pods" {
    type = string
    description = "Secondary Pods Range"
  
}

variable "composer_service" {
    type = string
    description = "Secondary Service Range"
  
}

#########################################
############### SERVICE ACC #############
#########################################
variable "composer_sa" {
  type = string
  default = "Display Name of Composer Service Account"
  
}

variable "other_sa" {
  type = string
  default = "Display name for other SA"
  
}

variable "project_id" {
  type = string
  
}

###new