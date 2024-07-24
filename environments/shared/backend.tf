terraform {
  backend "gcs" {
    bucket = "tfsate-dev"
    prefix = "terraform/state/shared"
  }
}
