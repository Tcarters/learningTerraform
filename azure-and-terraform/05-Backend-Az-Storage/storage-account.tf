
# 1. Defined local variables for Storage account creationg
locals {
  StorageName = "stgeaccountbackendtf01"
  localisation = var.default_Location
  storageResourceGroup = var.default_RGroup
  type_account = "Standard"
  type_replication = "GRS"
}

# 2. Create a Standard storage account with versioning enabled
resource "azurerm_storage_account" "storageAccountName" {
    name = local.StorageName
    location = local.localisation
    resource_group_name = local.storageResourceGroup
    account_tier = local.type_account
    account_replication_type = local.type_replication

    blob_properties {
            versioning_enabled = true
    }

    tags = {
    environment = "staging"
  }
  
}

# 3. Create a container inside Storage account
resource "azurerm_storage_container" "container01" {
  name                  = "container01-for-backend-tf"
  storage_account_name  = azurerm_storage_account.storageAccountName.name
  container_access_type = "blob"
}