variable "vpc_network_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "This is aws vpc network cidr block"

}
/*
variable "web1subnetcidr" {
  type        = string
  default     = "10.10.0.0/24"
  description = "This is web1 subnet cidr"
}
*/
variable "aws_subnet_cidr_ranges" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.30.0/24", "10.10.4.0/24", "10.10.5.0/24"]
  description = "these are aws subnet ranges"
}
variable "aws_subnet_names" {
  type        = list(string)
  default     = ["app1", "app2", "web1", "web2", "db1", "db2"]
  description = "These are default values of subnet names"


}