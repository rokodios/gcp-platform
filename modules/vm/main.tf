resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = "n1-standard-1"
  zone         = "${var.region}-a"

  labels = var.labels

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = var.network_name
    access_config {}
  }
}
