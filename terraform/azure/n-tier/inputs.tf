variable "network-range" {
  type        = string
  default     = "10.10.0.0/16"
  description = "This is description for azure virtual network"
}
variable "resource_group_name" {
  type        = string
  default     = "myresg"
  description = "This is description to create resource group"

}
variable "location" {
  type        = string
  default     = "eastus"
  description = "This is default location to create the resources"
}
/*
variable "subnet_prefixes" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.0.1/24", "10.10.0.2/24"]
  description = "This is subnet cidr ranges"
}
*/
variable "subnet_names" {
  type        = list(string)
  default     = ["app1", "app2", "app3"]
  description = "These are default subnet name values"

}
variable "web_nsg_config" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = string
      direction                  = string
      }
    ))
  })

}