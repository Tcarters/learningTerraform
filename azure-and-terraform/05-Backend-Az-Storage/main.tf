
## It's recommended to store terraform states files in different folder from actual configuration folder. Meaning stock terraform states in the cloud provider storage account.
## So Terraform state files will be stored in Azure storage account

### Step 1: Create a Resource Group
### Step 2: Create an Azure storage account
### Step 3: Create an Azure storage account

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


resource "azurerm_resource_group" "rGrpname" {
    name = var.default_RGroup
    location = var.default_Location
}
