network-range       = "10.10.0.0/16"
resource_group_name = "myresg"
location            = "eastus"
#subnet_prefixes     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
subnet_names = ["app1", "app2", "app3"]
web_nsg_config = {
  name = "webnsg"
  rules = [{
    name                       = "httpweb"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = "300"
    direction                  = "Inbound"
    },
    {
      name                       = "sshweb"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = "310"
      direction                  = "Inbound"
  }]
}