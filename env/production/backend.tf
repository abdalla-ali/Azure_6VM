terraform {
  backend "azurerm" {
    storage_account_name = "npctfjbstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
