variable "account" {
  type        = "string"
  description = "The AWS account id to create the environment"
  default     = "261567712600"
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  environment    = "stg"
  stack          = "tvg"
  region         = "virgin"
  name           = "${local.environment}-${local.region}"
  vpc_cidr_block = "10.32.0.0/16"
  azs_count      = "2"
  comment        = ""

  #emb-shared values to peering connection
  # cidr_vpc_remote_peering = "172.21.84.0/22"
  # peer_owner_id           = "401707138556"
  # peer_vpc_id             = "vpc-9774cfff"

  public_subnets_cidr_block = [
    "10.32.1.0/24",
    "10.32.2.0/24",
  ]
  private_subnets_cidr_block = [
    "10.32.100.0/26",
    "10.32.100.64/26",
  ]
  # database_subnets_cidr_block = [
  #   "172.21.140.0/23",
  #   "172.21.142.0/23",
  # ]
  tags = {
    "System ID"           = "TVG"
    "System"              = "Shared Services"
    "Key-user"            = "Gabriel"
    "Cost Center Project" = ""
    "Cost Center UN1"     = ""
    "Cost Center UN2"     = ""
    "Cost Center UN3"     = ""
    "Parent System ID"    = ""
    "Parent System"       = "Shared Services"
    "Environment"         = "STG"
    "Domain"              = ""
  }
}
