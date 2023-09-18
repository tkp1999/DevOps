variable "vpc_network_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "This is aws vpc network cidr block"

}
variable "web1subnetcidr" {
  type        = string
  default     = "10.10.0.0/24"
  description = "This is web1 subnet cidr"
}