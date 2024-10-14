resource "azurerm_subnet" "thisisSubnet1" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.thisisRG.name
  virtual_network_name = azurerm_virtual_network.thisisVnet.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_subnet" "thisisSubnet2" {
  name                 = "dmz-subnet"
  resource_group_name  = azurerm_resource_group.thisisRG.name #var.RGname
  virtual_network_name = azurerm_virtual_network.thisisVnet.name
  address_prefixes     = ["10.0.2.0/24"]

}