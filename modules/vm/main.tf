resource "google_compute_instance" "vm_instance" {
  for_each    = { for idx, instance in var.instances : idx => instance }
  name        = each.value.name
  machine_type = each.value.machine_type
  zone        = each.value.zone

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = var.network_name
    access_config {
    }
  }

  labels = var.labels

  tags = ["${each.value.name}-tag"]
}
