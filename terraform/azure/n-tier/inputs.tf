variable "network-range" {
  type = list(string)
  default = [ "10.10.0.0/16" ]
  description = "This is description for azure virtual network"
}
variable "resource_group_name" {
  type = string
  default = "myresg"
  description = "This is description to create resource group"

}
variable "location" {
  type = string
  default = "eastus"
  description = "This is default location to create the resources"
}