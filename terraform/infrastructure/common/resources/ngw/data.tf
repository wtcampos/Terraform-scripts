variable "eip_id" {
  type = "string"
}

variable "subnet_id" {
  type = "string"
}

variable "tags" {
  type        = "map"
  description = "A map with extra tags (up to 9) to be put in the resources. The Name tag is already handled by the blueprint and should not be referenced here (default {})"
  default     = {}
}

variable "name" {
  type = "string"
}
