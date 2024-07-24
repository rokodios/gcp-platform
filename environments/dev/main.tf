provider "google" {
  project = var.project
  region  = var.region
}

module "vpc" {
  source = "../../modules/vpc"
  project_id = var.project
  network_name = "dev-vpc"
  labels = {
    environment = "dev"
  }
}

module "vm" {
  source = "../../modules/vm"
  project_id = var.project
  region = var.region
  instance_name = "dev-vm"
  network_name = module.vpc.network_name
  labels = {
    environment = "dev"
    department  = "devel"
  }
}

module "gke" {
  source = "../../modules/gke"
  project_id = var.project
  region = var.region
  cluster_name = "dev-gke"
  labels = {
    environment = "dev"
    department  = "devel"
  }
}