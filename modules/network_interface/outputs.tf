# modules/network_interface/outputs.tf

output "network_interface_ids" {
  description = "List of network interface IDs"
  value = [for ni in azurerm_network_interface.nic : ni.id]
}

