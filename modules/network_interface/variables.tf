variable "count" {
  type        = number
  description = "Number of Network Interfaces to create"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure location"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet the network interface will be attached to"
}
