resource "google_compute_instance" "vm_instance" {
  for_each = { for inst in var.instances : inst.name => inst }
  
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link

    access_config {
      // Include this block to give the VM an external IP address
    }
  }

  labels = {
    environment = var.environment
    department  = var.department
  }
}
