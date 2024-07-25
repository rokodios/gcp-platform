provider "google" {
  project = var.project
  region  = var.region
}

module "vpc" {
  source = "../../modules/vpc"
  network_name = "shared-vpc-devopso"
  labels = {
    environment = "shared"
  }
}

module "lb" {
  source = "../../modules/lb"
  project_id = var.project
  region = var.region
  network_name = module.vpc.network_name
  #target_envs = ["dev", "pre", "pro"]
  target_instance_groups = ["dev-instance-group", "pre-instance-group", "pro-instance-group"]
  labels = {
    environment = "shared"
  }
}
