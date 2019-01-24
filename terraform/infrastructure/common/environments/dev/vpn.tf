module "vpn" {
  source = "../../resources/vpn"
  vpc_id = "${module.vpc.vpc["id"]}"
  name   = "VPG-${local.environment}"
  tags   = "${local.tags}"

  # peer_owner_id = "${local.peer_owner_id}"
  # peer_vpc_id   = "${local.peer_vpc_id}"
}
