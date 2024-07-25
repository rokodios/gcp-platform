output "vpc_network_name" {
  value = module.vpc.network_name
}

output "vm_instance_name" {
  value = module.vm.instance_name
}

output "lb_ip_address" {
  value = module.lb.ip_address
}
