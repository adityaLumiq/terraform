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

variable "big_query_dataset" {
    type = string
    description = "name of big query"
}

variable "logs_sink" {
    type = string
    description = "name sink"
  
}