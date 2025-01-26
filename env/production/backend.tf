terraform {
  backend "azurerm" {
    resource_group_name   = "RG-QCH-JB-001"
    storage_account_name = "npctfjbstate2"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
