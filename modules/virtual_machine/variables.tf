# modules/virtual_machine/variables.tf

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 3
}

variable "location" {
  description = "The location where the VM will be created"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the VM"
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the VM"
  type        = string
}

variable "network_interface_ids" {
  description = "List of network interface IDs for the VM"
  type        = list(string)
}

variable "vm_name_prefix" {
  description = "The prefix for VM names"
  type        = string
}
