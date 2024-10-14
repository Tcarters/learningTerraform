resource "azurerm_resource_group" "thisResourceGrp" {
  name     = "rg-vnet-tf"
  location = "West Europe"
}

# resource "azurerm_network_security_group" "example" {
#   name                = "example-security-group"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

resource "azurerm_virtual_network" "thisVirtualNetwork" {
  name                = "tf-Vnetwork"
  location            = azurerm_resource_group.thisResourceGrp.location # using existing resource created called ~> INTERPOLATION
  resource_group_name = azurerm_resource_group.thisResourceGrp.name
  address_space       = ["192.168.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "web-subnet1"
    address_prefixes = ["192.168.1.0/24"] # Subnet IP range should be in the Vnet IP address range
  }

  subnet {
    name             = "dns-subnet2"
    address_prefixes = ["192.168.2.0/24"]
    # security_group   = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "stage"
  }
}