resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "vms" {
  source              = "../../modules/vm"
  vm_count            = var.vm_count
  resource_group_name = azurerm_resource_group.rg.name
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  location            = var.location
}
