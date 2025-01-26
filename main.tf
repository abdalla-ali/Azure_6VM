provider "azurerm" {
  features {}
}

resource "azurerm_virtual_machine" "vmr" {
  count                = 6
  name                 = "vmr-${count.index + 1}"
  location             = "Qatar Central"
  resource_group_name  = "your_resource_group_name" // Replace with your resource group name
  network_interface_ids = [
    azurerm_network_interface.vmr[count.index].id
  ]
  vm_size              = "Standard_D4d_v4"

  storage_os_disk {
    name              = "vmr_os_disk_${count.index + 1}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "vmr-${count.index + 1}"
    admin_username = "adminuser" // Replace with your admin username
    admin_password = "Password1234!" // Replace with your admin password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "vmr" {
  count               = 6
  name                = "vmr-nic-${count.index + 1}"
  location            = "Qatar Central"
  resource_group_name = "your_resource_group_name" // Replace with your resource group name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sub1.id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_subnet" "sub1" {
  name                 = "sub1"
  virtual_network_name = "vnet1"
  resource_group_name  = "your_resource_group_name" // Replace with your resource group name
}
