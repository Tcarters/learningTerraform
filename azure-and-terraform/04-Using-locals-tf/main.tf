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

resource "azurerm_resource_group" "default_RGroup" {
    name = var.RGname  #"rGroup-AVSet"
    location = var.locationName    #"France Central" 
}

# resource "azurevm_vm" "name" {
  
# }