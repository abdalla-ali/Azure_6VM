variable "nic_count" {
  description = "Number of network interfaces to create"
  type        = number
  default     = 3
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
  default     = "/subscriptions/60f6a19f-76bd-46af-b5fd-e25ff391ef6e/resourceGroups/RG-QCH-JB-001/providers/Microsoft.Network/virtualNetworks/VNET-QCH-HUB-01/subnets/snet-qch-t1-mgmt-01"
}
