# Network Interface resource
resource "azurerm_network_interface" "nic" {
  count               = var.count  # Create the number of NICs as specified
  name                = "nic-${count.index + 1}"  # NIC names (e.g., nic-1, nic-2)
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id  # Attach to the existing subnet
    private_ip_address_allocation = "Dynamic"  # Dynamic private IP allocation
  }
}

# Output the Network Interface IDs
output "network_interface_ids" {
  value = azurerm_network_interface.nic[*].id
}
