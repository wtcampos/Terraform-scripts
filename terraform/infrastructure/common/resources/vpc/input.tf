variable "public_route_id" {
  type = "string"
}

variable "private_route_id" {
  type = "string"
}

variable "azs" {
  type        = "list"
  description = "A list with the VPC to use"
}

variable "az_count" {
  type    = "string"
  default = "The number of availability zones to be use to create subnets and private routes"
}

variable "name" {
  type        = "string"
  description = "A name for the VPC and related elements"
}

variable "cidr_block" {
  type        = "string"
  description = "The VPC network CIDR Block"
}

variable "instance_tenancy" {
  type        = "string"
  default     = "default"
  description = "The VPC tenancy default when launching instances. Valid values are 'default' and 'dedicated' (default: default)"
}

variable "domain_name" {
  type        = "string"
  description = "The internal DNS domain name for the VPC and DHCP options. required if at least one of them is enabled"
  default     = ""
}

variable "hosted_zone_comment" {
  type        = "string"
  description = "A comment for the internal hosted zone. This is ignored if custom_route53_zone_id is set"
  default     = "Created by Claranet Brazil VPC blueprint"
}

variable "custom_route53_zone_id" {
  description = "The id of an existing route52 private zone to be associate with the VPC. This will mitigate the creation of a new zone."
  default     = ""
}

variable "custom_dhcp_options_id" {
  description = "The ID of the DHCP Options to associate to the VPC. This will mitigate the creation of an DHCP option by this blueprint."
  default     = ""
}

variable "domain_name_servers" {
  type        = "list"
  default     = ["AmazonProvidedDNS"]
  description = "The list of DNS servers address to put on resolv.conf (default: AmazonProvidedDNS)"
}

variable "ntp_servers" {
  type        = "list"
  description = "A list of NTP servers to deliver via DHCP (default [])"
  default     = []
}

variable "netbios_name_servers" {
  type        = "list"
  description = "A list of netbios name servers to deliver via DHCP (default [])"
  default     = []
}

variable "netbios_node_type" {
  type        = "string"
  description = "The NetBIOS node type (1, 2, 4, or 8). AWS recommends to specify 2 since broadcast and multicast are not supported in their network. For more information about these node types, see RFC 2132. (default 2)"
  default     = 2
}

variable "public_subnets_cidr_block" {
  type        = "list"
  description = "A list with the public subnets CIDR blocks"
}

variable "map_public_ip_on_launch" {
  type        = "string"
  description = "If the public subnets should associate an public IP for instances launched on them. Use with caution (default false)"
  default     = false
}

variable "s3_endpoint_policy" {
  type        = "string"
  description = "The endpoint policy JSON body (default empty)"
  default     = ""
}

variable "tags" {
  type        = "map"
  description = "A map with extra tags (up to 9) to be put in the resources. The Name tag is already handled by the blueprint and should not be referenced here (default {})"
  default     = {}
}
