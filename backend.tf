# Backend configuration for storing Terraform state in Azure Blob Storage
terraform {
  backend "azurerm" {
    resource_group_name   = "RG-QCH-JB-001"        # The resource group where your storage account is located
    storage_account_name  = "tfstateazure"          # Name of your existing Azure Storage Account
    container_name        = "tfstatestore"          # Name of the container where the Terraform state will be stored
    key                    = "terraform.tfstate"    # The name of the state file (e.g., terraform.tfstate)
  }
}
