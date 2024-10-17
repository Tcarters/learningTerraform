output "webSubnet" {
    description = "This is web subnet ID"
    value = azurerm_subnet.thisSubnet01.id
  
}

output "dnsSubnet" {
    description = "This is dns subnet ID"
    value = azurerm_subnet.thisSubnet02.id
}

