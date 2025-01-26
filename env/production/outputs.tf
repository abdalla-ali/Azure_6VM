resource "azurerm_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "QCH-MGMT-JB-T1-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]
  vm_size            = "Standard_D4ds_v4"
  availability_set_id = azurerm_availability_set.vm_availability_set.id

  storage_os_disk {
    name              = "${var.vm_name_prefix}-${count.index + 1}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  os_profile {
    computer_name  = "QCH-MGMT-JB-T1-${count.index + 1}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
    enable_automatic_upgrades = true
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

output "vm_ids" {
  value = azurerm_virtual_machine.vm[*].id
}