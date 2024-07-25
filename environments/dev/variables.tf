variable "project_id" {
  description = "The GCP project to use"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
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
  default = [
    {
      name         = "dev-vm-test"
      machine_type = "f1-micro"
      zone         = "us-east1"
      image        = "debian-cloud/debian-10"
    }
  ]
}
