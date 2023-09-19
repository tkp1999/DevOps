resource "azurerm_virtual_network" "myazurevnet" {
  name                = "myazurevnet"
  resource_group_name = azurerm_resource_group.myresg.name
  address_space       = [var.network-range]
  location            = "eastus"
  depends_on          = [azurerm_resource_group.myresg]
}
resource "azurerm_subnet" "subnets" {
  #count                = length(var.subnet_prefixes)
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.myresg.name
  virtual_network_name = azurerm_virtual_network.myazurevnet.name
  #address_prefixes     = [var.subnet_prefixes[count.index]]
  address_prefixes = [cidrsubnet(var.network-range, 8, count.index)]

  depends_on = [
    azurerm_resource_group.myresg,
    azurerm_virtual_network.myazurevnet
  ]

}
resource "azurerm_network_security_group" "azure_web_nsg" {
  name                = var.web_nsg_config.name
  resource_group_name = azurerm_resource_group.myresg.name
  location            = azurerm_resource_group.myresg.location

  depends_on = [azurerm_resource_group.myresg]
}
resource "azurerm_network_security_rule" "webnsg_rules" {
  name                        = var.web_nsg_config.rules[count.index].name
  count                       = length(var.web_nsg_config.rules)
  network_security_group_name = azurerm_network_security_group.azure_web_nsg.name
  resource_group_name         = azurerm_resource_group.myresg.name
  protocol                    = var.web_nsg_config.rules[count.index].protocol
  source_port_range           = var.web_nsg_config.rules[count.index].source_port_range
  source_address_prefix       = var.web_nsg_config.rules[count.index].source_address_prefix
  destination_address_prefix  = var.web_nsg_config.rules[count.index].destination_address_prefix
  destination_port_range      = var.web_nsg_config.rules[count.index].destination_port_range
  access                      = var.web_nsg_config.rules[count.index].access
  priority                    = var.web_nsg_config.rules[count.index].priority
  direction                   = var.web_nsg_config.rules[count.index].direction
  depends_on = [
    azurerm_network_security_group.azure_web_nsg,
    azurerm_subnet.subnets
  ]


}