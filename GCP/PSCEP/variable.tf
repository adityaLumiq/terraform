variable "region" {
    type = string
    description = "asia-south1"
}

variable "zone" {
    type = string
    description = "asia-south1-c"
}

variable "firewall" {
    type = string
    description = "Name of firewall"
}

variable "nat_name" {
    type = string
    description = "Name of NAT gateway"
}

variable "router_name" {
    type = string
    description = "Name of Router"
}

variable "forwarding_rule" {
    type = string
    description = "Name of firewall_rule"
}

variable "psc_ilb" {
    type = string
    description = "Name of pscilb"
}

variable "subnetwork-name" {
    type = string
    description = "Name of subnetwork"
}

variable "network-name" {
    type = string
    description = "Name of Network"
  
}