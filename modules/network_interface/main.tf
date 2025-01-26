# Network Interface resource
resource "azurerm_network_interface" "nic" {
  count               = var.nic_count  # Create the number of NICs as specified
  name                = "QCH-MGMT-JB-T1-nic-${count.index + 1}"  # NIC names (e.g., nic-1, nic-2)
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id  # Attach to the existing subnet
    private_ip_address_allocation = "Dynamic"  # Dynamic private IP allocation
  }
}