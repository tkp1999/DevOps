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
resource "azurerm_resource_group" "myresourcegroup" {
  name     = "myresourcegroup"
  location = "eastus"
}
resource "azurerm_storage_account" "azurestorageaccount" {
  resource_group_name      = "myresourcegroup"
  name                     = "fromtflearningtf"
  location                 = "eastus"
  account_replication_type = "GRS"
  account_tier             = "Standard"

}