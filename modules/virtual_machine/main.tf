# Virtual Machine resource
resource "azurerm_virtual_machine" "vm" {
  count                = var.count  # Create the number of VMs as specified
  name                 = "${var.vm_name_prefix}-${count.index + 1}"  # VM names (e.g., vm-1, vm-2)
  location             = var.location
  resource_group_name  = var.resource_group_name
  network_interface_ids = var.network_interface_ids  # Attach the NICs to the VMs
  vm_size              = var.vm_size

  storage_os_disk {
    name              = "os_disk-${count.index + 1}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.vm_name_prefix}-${count.index + 1}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
}

output "vm_names" {
  value = azurerm_virtual_machine.vm[*].name
}
