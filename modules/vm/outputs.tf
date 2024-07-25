output "instance_names" {
  description = "Names of the instances"
  value = { for k, v in google_compute_instance.vm_instance : k => v.name }
}

output "instance_ips" {
  description = "Public IP addresses of the instances"
  value = { for k, v in google_compute_instance.vm_instance : k => v.network_interface[0].access_config[0].nat_ip }
}
