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

