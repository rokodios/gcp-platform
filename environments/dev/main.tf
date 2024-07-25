provider "google" {
  project = var.project_id
  region  = "us-central1"
}

module "vpc" {
  source       = "../../modules/vpc"
  project_id   = var.project_id
  network_name = "dev-network"
}

module "vm" {
  source        = "../../modules/vm"
  project_id    = var.project_id
  region        = "us-central1"
  network_name  = module.vpc.network_name
  environment   = var.environment
  department    = var.department
  instances     = var.instances
}
