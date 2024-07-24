psprovider "google" {
  project = var.project
  region  = var.region
}

module "vpc" {
  source       = "../modules/vpc"
  project_id   = var.project
  network_name = "dev-vpc-devopso"
}

module "vm" {
  source        = "../modules/vm"
  network_name  = module.vpc.network_name
  labels = {
    environment = "dev"
    department  = "devops"
  }
  instances = [
    {
      name         = "dev-vm-test"
      machine_type = "f1-micro"
      zone         = "us-east1"
      image        = "debian-cloud/debian-10"
    }
  ]
}
