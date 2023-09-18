resource "azurerm_virtual_network" "myazurevnet" {
  name                = "myazurevnet"
  resource_group_name = azurerm_resource_group.myresg.name
  address_space       = var.network-range
  location            = "eastus"
  depends_on          = [azurerm_resource_group.myresg]
}
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_prefixes)
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.myresg.name
  virtual_network_name = azurerm_virtual_network.myazurevnet.name
  address_prefixes     = [var.subnet_prefixes[count.index]]

  depends_on = [
    azurerm_resource_group.myresg,
    azurerm_virtual_network.myazurevnet
  ]

}