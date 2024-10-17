
## 0.1 Define a Resource Group
resource "azurerm_resource_group" "main-RG" {
    name = var.main_resource_group
    location = var.main_location
  
}

## 0.2 Define a virtual net
resource "azurerm_virtual_network" "main-VNet" {
    name = "staging-Vnet"
    address_space       = ["10.0.0.0/8"]
    location            = azurerm_resource_group.main-RG.location
    resource_group_name = azurerm_resource_group.main-RG.name
  
}

## 0.3 Define two subnets

resource "azurerm_subnet" "thisSubnet01" {
    name = "web-subnet"
    resource_group_name = azurerm_resource_group.main-RG.name
    virtual_network_name = azurerm_virtual_network.main-VNet.name
    address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "thisSubnet02" {
    name = "dns-subnet"
    resource_group_name = azurerm_resource_group.main-RG.name
    virtual_network_name = azurerm_virtual_network.main-VNet.name
    address_prefixes = ["10.0.2.0/24"]
}