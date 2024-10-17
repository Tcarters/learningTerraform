output "resource_group_name" {
    description = "The global resource group name for all project "
    value = azurerm_resource_group.rGrpname.name
}

output "location" {
  value = azurerm_resource_group.rGrpname.location
}
