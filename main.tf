provider "azurerm" {
  features {}
  subscription_id = "60f6a19f-76bd-46af-b5fd-e25ff391ef6e"
}

resource "azurerm_virtual_machine" "vmr" {
  count                = 6
  name                 = "QCH-MGMT-JB-T1-${count.index + 1}"
  location             = "Qatar Central"
  resource_group_name  = "RG-QCH-JB-001" // Replace with your resource group name
  network_interface_ids = [
    azurerm_network_interface.vmr[count.index].id
  ]
  vm_size              = "D2_v2_Promo"

  storage_os_disk {
    name              = "vmr_os_disk_${count.index + 1}"
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
    computer_name  = "QCH-MGMT-JB-T1-${count.index + 1}"
    admin_username = "azadmin" // Replace with your admin username
    admin_password = "Qatar@2025" // Replace with your admin password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
}

data "azurerm_virtual_network" "existing_vnet" {
  name                = "VNET-QCH-HUB-01"
  resource_group_name = "RG-QCH-JB-001"
}

data "azurerm_subnet" "sub1" {
  name                 = "snet-qch-t1-mgmt-01"
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = data.azurerm_virtual_network.existing_vnet.resource_group_name
}

output "subnet_id" {
  value = data.azurerm_subnet.sub1.id
}

resource "azurerm_network_interface" "vmr" {
  count               = 6
  name                = "QCH-MGMT-JB-T1-nic-${count.index + 1}"
  location            = "Qatar Central"
  resource_group_name = "RG-QCH-JB-001" // Replace with your resource group name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/60f6a19f-76bd-46af-b5fd-e25ff391ef6e/resourceGroups/RG-QCH-JB-001/providers/Microsoft.Network/virtualNetworks/VNET-QCH-HUB-01/subnets/snet-qch-t1-mgmt-01"
    private_ip_address_allocation = "Dynamic"
  }
}


