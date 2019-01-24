variable "vpc" {
  type = "string"
  description = "The VPC which the subnets belongs"
}

variable "cidr_blocks" {
  type = "list"
  description = "The list of CIDR blocks for the subnets. It must match with a subset of the VPC CIDR"
}

variable "azs" {
  type = "list"
  description = "The list of availability zones to associate the subnets. The sequence will match with the CIDR blocks"
}

variable "prefix" {
  type = "string"
  description = "A prefix to prepend to the subnets names. This module will append a suffix with the "
}

variable "route_tables" {
  type = "list"
  description = "The list of route tables to associate with the subnets. The sequence will match with the CIDR blocks"
}

variable "subnet_count" {
  type = "string"
  description = "How many subnets must be created. This value must be equal or less the CIDR blocks count"
  default = 1
}

variable "map_public_ip_on_launch" {
  type = "string"
  description = "If the subnet must map an public IP to the EC2 instances inside the subnet. Use with caution (Default false)"
  default = false
}

variable "tags" {
  type = "map"
  description = "Extra tags (up to 9) to add to the subnets. The Name tag is automatically set and should not be passed here again. (default: {})"
  default = {}
}
