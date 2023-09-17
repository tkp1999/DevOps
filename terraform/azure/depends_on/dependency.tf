terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.73.0"
    }
  }
}
provider "azurerm" {
  features {

  }

}

resource "azurerm_resource_group" "myresg" {
  name     = "myresg1"
  location = "eastus"

}
resource "azurerm_storage_account" "storageaccount1" {
  resource_group_name      = azurerm_resource_group.myresg.name
  location                 = azurerm_resource_group.myresg.location
  name                     = "storageaccountintf"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}