terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.5.0"
    }
  }

  backend "azurerm" {

    resource_group_name = "rg-Backend-TF"
    storage_account_name = "stgeaccountbackendtf01" #
    container_name = "container01-for-backend-tf"
    key = "terraform.tfstate"
    
    }
}

  provider "azurerm" {
    # Configuration options
    subscription_id = var.subscription_id
    features {}
    
  }