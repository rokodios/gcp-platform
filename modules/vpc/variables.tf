variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "environment" {
  description = "Environment label for the instances"
  type        = string
}

variable "department" {
  description = "Department label for the instances"
  type        = string
}
