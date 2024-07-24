provider "google" {
  project = var.project
  region  = var.region
}

module "vpc" {
  source = "../../modules/vpc"
  project_id = var.project
  network_name = "pre-vpc"
  labels = {
    environment = "pre"
  }
}

module "vm" {
  source = "../../modules/vm"
  project_id = var.project
  region = var.region
  instance_name = "pre-vm"
  network_name = module.vpc.network_name
  labels = {
    environment = "pre"
    department  = "devops"
  }
}

module "gke" {
  source = "../../modules/gke"
  project_id = var.project
  region = var.region
  cluster_name = "pre-gke"
  labels = {
    environment = "pre"
    department  = "devops"
  }
}
