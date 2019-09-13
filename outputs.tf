output "pcf_resource_group" {
  value = "${azurerm_resource_group.pcf_resource_group.name}"
}

output "pcf_storage_account" {
  value = "${azurerm_storage_account.pcf_general_sa.name}"
}