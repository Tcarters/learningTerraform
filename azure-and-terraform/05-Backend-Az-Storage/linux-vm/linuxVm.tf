## The purpose of this configuration is to demonstrate:
## - Use Create a terraform backend configuration based on the azure storage account created in main workspace
## - then launch a linux vm machine.

## 0.0: Define configuration for shared outputs between storage account state file
data "terraform_remote_state" "get_storage_account" { 
    ## this remote data is used to access outputs data of the Storage Account created in the Up folder.
    ## Basically here only resource group name is shared with actual configurations here.
  backend = "local"

  config = {
   
    path = "../terraform.tfstate"

  }
}

## 0.1: Create a Virtual Network 
resource "azurerm_virtual_network" "virtual-network" {
  name = "Vnet-for-linuxVM"
  address_space       = ["10.0.0.0/16"]
  location            = var.defaultLocation
  resource_group_name = data.terraform_remote_state.get_storage_account.outputs.resource_group_name
}


## 0.2 : Define the subnet
resource "azurerm_subnet" "subnet01" {
    name = "Vm-subnet01"
    resource_group_name  = data.terraform_remote_state.get_storage_account.outputs.resource_group_name
    virtual_network_name = azurerm_virtual_network.virtual-network.name
    address_prefixes     = ["10.0.2.0/24"]
}

## 0.3 : Define network Interface
resource "azurerm_network_interface" "defaultNic" {
  name                = "${azurerm_subnet.subnet01.name}-nic"
  location            = var.defaultLocation #azurerm_resource_group.example.location
  resource_group_name = data.terraform_remote_state.get_storage_account.outputs.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet01.id
    private_ip_address_allocation = "Dynamic"
  }
}


## 0.4 : Create a Linux virtual machine
resource "azurerm_linux_virtual_machine" "Vm" {
  name                = "linux-Vm01"
  resource_group_name = data.terraform_remote_state.get_storage_account.outputs.resource_group_name  #azurerm_resource_group.example.name
  location            = var.defaultLocation
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.defaultNic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./ssh-key/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
