# Output the VM names
output "vm_names" {
  value = module.virtual_machine.vm_names
  description = "List of Virtual Machine names"
}

# Output the Subnet ID (for reference)
output "subnet_id" {
  value = data.azurerm_subnet.existing_subnet.id
  description = "The ID of the existing subnet"
}

# Output the Network Interface IDs
output "network_interface_ids" {
  value = module.network_interface.network_interface_ids
  description = "List of Network Interface IDs"
}
