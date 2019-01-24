module "private_subnets" {
  source = "../../resources/subnet"

  vpc                     = "${module.vpc.vpc["id"]}"
  cidr_blocks             = "${local.private_subnets_cidr_block}"
  azs                     = "${data.aws_availability_zones.available.names}"
  prefix                  = "SN-pr-${local.environment}"
  route_tables            = ["${module.private_route.route_table_id}"]
  subnet_count            = "${local.azs_count}"
  map_public_ip_on_launch = false
  tags                    = "${local.tags}"
}

module "public_subnets" {
  source = "../../resources/subnet"

  vpc                     = "${module.vpc.vpc["id"]}"
  cidr_blocks             = "${local.public_subnets_cidr_block}"
  azs                     = "${data.aws_availability_zones.available.names}"
  prefix                  = "SN-pu-${local.environment}"
  route_tables            = ["${module.public_route.route_table_id}"]
  subnet_count            = "${local.azs_count}"
  map_public_ip_on_launch = false
  tags                    = "${local.tags}"
}

# module "database_subnets" {
#   source = "../../resources/subnet"
#
#   vpc                     = "${module.vpc.vpc["id"]}"
#   cidr_blocks             = "${local.database_subnets_cidr_block}"
#   azs                     = "${data.aws_availability_zones.available.names}"
#   prefix                  = "SN-db-${local.environment}"
#   route_tables            = ["${module.private_route.route_table_id}"]
#   subnet_count            = "${local.azs_count}"
#   map_public_ip_on_launch = false
#   tags                    = "${local.tags}"
# }

output "public_subnets_ids" {
  value = "${module.public_subnets.ids}"
}

output "private_subnets_ids" {
  value = "${module.private_subnets.ids}"
}

output "public_subnets_availability_zone" {
  value = "${module.public_subnets.azs}"
}

output "private_subnets_availability_zone" {
  value = "${module.private_subnets.azs}"
}

# output "database_subnets_ids" {
#   value = "${module.database_subnets.ids}"
# }

