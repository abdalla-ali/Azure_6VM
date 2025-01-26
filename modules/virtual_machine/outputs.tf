output "vm_names" {
  description = "List of VM names"
  value = [for vm in azurerm_virtual_machine.vmr : vm.name]
}