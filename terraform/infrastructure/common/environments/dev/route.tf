module "public_route" {
  name   = "RT-public"
  source = "../../resources/route"
  vpc_id = "${module.vpc.vpc["id"]}"
  tags   = "${local.tags}"
}

resource "aws_route" "public_route_igw" {
  route_table_id         = "${module.public_route.route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${module.igw.id}"
  depends_on             = ["module.public_route"]
}

resource "aws_route" "public_route_vpn" {
  route_table_id         = "${module.public_route.route_table_id}"
  destination_cidr_block = "10.0.0.0/8"
  gateway_id             = "${module.vpn.vpn_gateway_id}"
  depends_on             = ["module.public_route"]
}

module "private_route" {
  name   = "RT-private"
  source = "../../resources/route"
  vpc_id = "${module.vpc.vpc["id"]}"
  tags   = "${local.tags}"
}

resource "aws_route" "private_route_igw" {
  route_table_id         = "${module.private_route.route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${module.ngw.id}"
  depends_on             = ["module.private_route", "module.ngw"]
}

resource "aws_route" "private_route_vpn" {
  route_table_id         = "${module.private_route.route_table_id}"
  destination_cidr_block = "10.0.0.0/8"
  gateway_id             = "${module.vpn.vpn_gateway_id}"
  depends_on             = ["module.private_route"]
}
