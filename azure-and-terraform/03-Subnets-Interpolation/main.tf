terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.5.0"

    }
  }
}

provider "azurerm" {
    
    subscription_id = var.subscription_id
    features {
      
    }
  
}

resource "azurerm_resource_group" "thisisRG" {
  name = var.RGname
  location = "West Europe"

}

resource "azurerm_virtual_network" "thisisVnet" {
  name = var.VnetName
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.thisisRG.location
  resource_group_name = azurerm_resource_group.thisisRG.name

}