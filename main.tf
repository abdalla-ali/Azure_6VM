provider "azurerm" {
  features {}
}

resource "azurerm_virtual_machine" "vmr" {
  count                = 6
  name                 = "QCH-MGMT-JB-T1-${count.index + 1}"
  location             = "Qatar Central"
  resource_group_name  = "RG-QCH-JB-001" // Replace with your resource group name
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
    computer_name  = "QCH-MGMT-JB-T1-${count.index + 1}"
    admin_username = "azadmin" // Replace with your admin username
    admin_password = "Qatar@2025" // Replace with your admin password
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
  name                = "QCH-MGMT-JB-T1-nic-${count.index + 1}"
  location            = "Qatar Central"
  resource_group_name = "RG-QCH-JB-001" // Replace with your resource group name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sub1.id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_subnet" "sub1" {
  name                 = "snet-qch-t1-mgmt-01"
  virtual_network_name = "VNET-QCH-HUB-01"
  resource_group_name  = "RG-QCH-JB-001" // Replace with your resource group name
}
