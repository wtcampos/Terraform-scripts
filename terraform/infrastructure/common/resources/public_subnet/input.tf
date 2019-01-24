# variable "tags" {
#   type        = "map"
#   description = "A map with extra tags (up to 9) to be put in the resources. The Name tag is already handled by the blueprint and should not be referenced here (default {})"
#   default     = {}
# }
#
# variable "subnets_cidr_block" {
#   type        = "list"
#   description = "A list with the public subnets CIDR blocks"
# }
#
# variable "cidr_block" {
#   type = "string"
# }
#
# variable "azs" {
#   type        = "list"
#   description = "A list with the VPC to use"
# }
#
# variable "name" {
#   type        = "string"
#   description = "A name for the VPC and related elements"
# }
#
# variable "az_count" {
#   type    = "string"
#   default = "The number of availability zones to be use to create subnets and private routes"
# }
#
# variable "map_public_ip_on_launch" {
#   type        = "string"
#   description = "If the public subnets should associate an public IP for instances launched on them. Use with caution (default false)"
#   default     = false
# }
#
# variable "vpc_id" {
#   type = "string"
# }

