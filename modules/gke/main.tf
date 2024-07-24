resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  resource_labels = var.labels

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  initial_node_count = 1
}