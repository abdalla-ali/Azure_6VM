# Provider configuration for Azure
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id  # Subscription ID passed as a variable for flexibility
}

# Fetch existing Virtual Network and Subnet using Data Sources
data "azurerm_virtual_network" "existing_vnet" {
  name                = var.vnet_name        # Name of the existing Virtual Network
  resource_group_name = var.resource_group_name  # Resource group where the VNet resides
}

data "azurerm_subnet" "existing_subnet" {
  name                 = var.subnet_name     # Name of the existing subnet
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = var.resource_group_name
}

# Module for Network Interface configuration
module "network_interface" {
  source               = "./modules/network_interface"
  count                = var.nic_count  # Dynamically create the desired number of NICs
  resource_group_name  = var.resource_group_name
  location             = var.location
  subnet_id            = data.azurerm_subnet.existing_subnet.id  # Using existing subnet
}

# Module for Virtual Machine configuration
module "virtual_machine" {
  source               = "./modules/virtual_machine"
  count                = var.vm_count  # Dynamically create the desired number of VMs
  resource_group_name  = var.resource_group_name
  location             = var.location
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  network_interface_ids = module.network_interface.network_interface_ids  # Passing NIC IDs to VMs
  vm_name_prefix       = var.vm_name_prefix
}
