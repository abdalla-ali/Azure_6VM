terraform {
  backend "azurerm" {
    storage_account_name = "npctfjbstate2"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
