variable "project_id" {
  description = "The GCP project to use"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "network_name" {
  description = "The name of the network to deploy resources"
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

variable "instances" {
  description = "A list of instances to create"
  type        = list(object({
    name         = string
    machine_type = string
    zone         = string
    image        = string
  }))
}

resource "google_compute_instance" "vm_instance" {
  for_each    = { for idx, vm in var.instances : idx => vm }
  name        = each.value.name
  machine_type = each.value.machine_type
  zone        = each.value.zone
  project     = var.project_id

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = var.network_name
  }

  labels = {
    environment = var.environment
    department  = var.department
  }
}
