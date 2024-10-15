
output "Id_AvailabilitySet" {
  description = "ID of the Availability set"
  value       = azurerm_availability_set.default_AVSet.id
  sensitive = false ## Displqy yes or no this data
}