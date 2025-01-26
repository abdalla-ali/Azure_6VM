# Data source for fetching existing Virtual Network
data "azurerm_virtual_network" "existing_vnet" {
  name                = var.vnet_name        # Name of the existing Virtual Network
  resource_group_name = var.resource_group_name  # Resource group where the VNet is located
}

# Data source for fetching existing Subnet
data "azurerm_subnet" "existing_subnet" {
  name                 = var.subnet_name     # Name of the existing subnet
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = var.resource_group_name
}

output "subnet_id" {
  value = data.azurerm_subnet.existing_subnet.id
}
