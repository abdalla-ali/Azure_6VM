# Azure Subscription ID (can be passed as an argument)
variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

# Name of the existing Virtual Network
variable "vnet_name" {
  type        = string
  description = "The name of the existing Virtual Network"
}

# Name of the existing Subnet
variable "subnet_name" {
  type        = string
  description = "The name of the existing Subnet"
}

# Name of the resource group containing the VNet and other resources
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = "RG-QCH-JB-001"
}

# Azure location where the resources will be deployed
variable "location" {
  type        = string
  description = "The Azure region to deploy resources in"
  default     = "Qatar Central"
}

# Number of Network Interfaces to create
variable "nic_count" {
  type        = number
  description = "The number of Network Interfaces to create"
  default     = 3
}

# Number of Virtual Machines to create
variable "vm_count" {
  type        = number
  description = "The number of Virtual Machines to create"
  default     = 3
}

# Size of the Virtual Machines (e.g., Standard_B2ms)
variable "vm_size" {
  type        = string
  description = "The size of the virtual machines"
  default     = "Standard_B2ms"
}

# Admin username for the Virtual Machines
variable "admin_username" {
  type        = string
  description = "The admin username for the VMs"
  default     = "azadmin"
}

# Admin password for the Virtual Machines
variable "admin_password" {
  type        = string
  description = "The admin password for the VMs"
  default     = "Qatar@2025"
}

# Prefix for VM names
variable "vm_name_prefix" {
  type        = string
  description = "Prefix for the VM names"
  default     = "QCH-MGMT-JB-T1"
}
