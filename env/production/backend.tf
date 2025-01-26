terraform {
  backend "azurerm" {
    resource_group_name   = "RG-QCH-JB-001"
    storage_account_name = "npctfjbstate2"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    access_key            = "D7OyIB4XpNHFBKvip4qLpyh9FOCPw2RbZN0batCJHCg8P28i3CHMJIiTT7hYfVVCi3skpFsWZwBm+AStkSVtSA=="
  }
}
