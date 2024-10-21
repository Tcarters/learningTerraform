
## Before we run the deployment in this folder, we should deploy virtual network with its subnets available in folder 06-Outputs-in-tf 

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

## 1. Retrieve terraform state file
data "terraform_remote_state" "get_Subnet_ID" {
    backend = "local"
    
    config = {
      path = "../06-Outputs-in-tf/terraform.tfstate"
    #   workspace_dir = "../06-Outputs-in-tf"
    }
}

## 2. Define resource group
# resource "azurerm_resource_group" "main_RGroup" {
#       name = "RG-subnet"
#       location = "France Central"
# }

# resource "azurerm_vir" "name" {
  
# }

## Add a network interface for existing subnet in Azure
resource "azurerm_network_interface" "NIC_01" {
  name                = "subnet01_NIC"
  location            = var.main_location #azurerm_resource_group.NIC_01.output.location
  resource_group_name = var.main_resource_group  #data.terraform_remote_state.get_Subnet_ID.resource.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.get_Subnet_ID.outputs.dnsSubnet # get subnet id from subnet name in outputs defined in remote terraform state file
    private_ip_address_allocation = "Dynamic"
  }
}