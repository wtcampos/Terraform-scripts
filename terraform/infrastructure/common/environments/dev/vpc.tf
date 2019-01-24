module "vpc" {
  source = "../../resources/vpc"

  name                      = "VPC-${local.environment}"
  domain_name               = "${local.name}.local"
  cidr_block                = "${local.vpc_cidr_block}"
  azs                       = "${data.aws_availability_zones.available.names}"
  az_count                  = "${local.azs_count}"
  hosted_zone_comment       = "${local.comment}"
  public_subnets_cidr_block = "${local.public_subnets_cidr_block}"
  tags                      = "${local.tags}"
  private_route_id          = "${module.private_route.route_table_id}"
  public_route_id           = "${module.public_route.route_table_id}"
}

output "this_remote_vpc" {
  value = "${module.vpc.vpc}"
}
