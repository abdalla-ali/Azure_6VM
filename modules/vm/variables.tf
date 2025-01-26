variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 6
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machines"
  type        = string
  default     = "Standard_D4ds_v4"
}

variable "os_image" {
  description = "OS image for the virtual machines"
  type        = string
  default     = "MicrosoftWindowsServer:WindowsServer:2022-Datacenter:latest"
}

variable "location" {
  description = "Location for the resources"
  type        = string
  default     = "Qatar Central"
}