variable "project_name" {
    type = string
    description = "Name of the project"
}

variable "project_id" {
    type = string
    description = "Project ID"
}

variable "region" {
    type = string
    description = "asia-south1"
}

variable "zone" {
    type = string
    description = "asia-south1-c"
  
}

variable "instance" {
    type = string
    description = "Name of Instance"
}

variable "subnetwork" {
    type = string
    description = "Name of Subnetwork"
}

variable "vpc_network_name" {
    type = string
    description = "Giving a name for vpc network"
}

variable "service_account" {
    type = string
    description = "Name of Service Account"
  
}

variable "zone_name" {
    type = string
    description = "Name of Zone"
  
}

variable "vpc-connector" {
    type = string
    description = "Name of Connector"
}

variable "router-name" {
    type = string
    description = "Name of Router"
}

variable "nat" {
    type = string
    description = "Name of NAT"
}

variable "cloud-run" {
    type = string
    description = "Name of Cloud-Run"
}