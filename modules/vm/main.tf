resource "google_compute_instance" "vm_instance" {
  for_each    = { for idx, vm in var.instances : idx => vm }
  name        = "${each.value.name}-${each.key}"
  machine_type = each.value.machine_type
  zone        = each.value.zone
  project     = var.project_id

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = var.network_name
  }

  labels = merge(
    var.labels,
    {
      "name"       = each.value.name
      "environment" = var.environment
      "department"  = var.department
    }
  )
}
