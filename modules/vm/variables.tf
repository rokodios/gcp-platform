variable "project_id" {
  description = "The GCP project to use"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "network_name" {
  description = "The name of the network to attach the instances"
  type        = string
}

variable "labels" {
  description = "Labels to apply to the instances"
  type        = map(string)
}

variable "instances" {
  description = "A list of instances to create"
  type        = list(object({
    name         = string
    machine_type = string
    zone         = string
    image        = string
  }))
}
