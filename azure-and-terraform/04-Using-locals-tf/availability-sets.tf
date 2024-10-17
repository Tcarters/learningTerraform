locals {
  avsetRGroup = azurerm_resource_group.default_RGroup.name  #var.RGname
  avsetLocation = var.locationName
  updateDomain = 3
  faultDomain = 2
}

resource "azurerm_availability_set" "default_AVSet" {
  name                = "AVSet-FCentral"
  location            = local.avsetLocation        #azurerm_resource_group.default_RGroup.location
  resource_group_name = local.avsetRGroup    #azurerm_resource_group.default_RGroup.name

  platform_update_domain_count = local.updateDomain
  platform_fault_domain_count  = local.faultDomain

  tags = {
    environment = "Testing"
  }
}
