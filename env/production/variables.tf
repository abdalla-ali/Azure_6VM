variable "environment" {
  description = "The environment for the deployment (e.g., production, staging)"
  type        = string
  default     = "production"
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "Qatar Central"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "RG-QCH-JB-001"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "VNET-QCH-HUB-01"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "snet-qch-t1-mgmt-01"
}

variable "vm_count" {
  description = "The number of virtual machines to deploy"
  type        = number
  default     = 6
}

variable "vm_size" {
  description = "The size of the virtual machines"
  type        = string
  default     = "Standard_D4ds_v4"
}

variable "os_image" {
  description = "The OS image for the virtual machines"
  type        = string
  default     = "latest_windows_image"  # Replace with actual image reference
}