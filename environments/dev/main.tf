provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source  = "../../modules/vpc"
  project_id = var.project_id
  region     = var.region
}

module "vm" {
  source        = "../../modules/vm"
  project_id    = var.project_id
  region        = var.region
  network_name  = module.vpc.network_name
  labels = {
    environment = var.environment
    department  = var.department
  }
  instances = var.instances
}
