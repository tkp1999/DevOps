resource "azurerm_virtual_network" "myazurevnet" {
    name = "myazurevnet"
    resource_group_name = azurerm_resource_group.myresg.name
    address_space = [ "10.10.0.0/16" ]
    location = "eastus"
    depends_on = [ azurerm_resource_group.myresg  ]
}