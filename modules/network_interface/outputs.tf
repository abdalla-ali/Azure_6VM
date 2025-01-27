# modules/network_interface/outputs.tf

output "network_interface_ids" {
  description = "List of network interface IDs"
  value = azurerm_network_interface.nic[*].id
}

