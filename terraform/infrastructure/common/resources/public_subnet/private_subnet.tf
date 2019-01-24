# resource "aws_vpn_gateway" "this" {
#   vpc_id = "${var.vpc_id}"
#
#   tags {
#     Name = "emb-dev-gateway"
#   }
# }
#
# resource "aws_route_table" "this_private" {
#   vpc_id = "${var.vpc_id}"
#
#   tags {
#     Name = "vpc-ohio-route-table"
#   }
# }
#
# resource "aws_route" "default_private_route" {
#   route_table_id         = "${aws_route_table.this_private.id}"
#   destination_cidr_block = "10.0.0.0/8"
#   gateway_id             = "${aws_vpn_gateway.this.id}"
# }
#
# module "private_subnets" {
#   source = "../subnet/"
#
#   vpc                     = "${var.vpc_id}"
#   cidr_blocks             = "${var.subnets_cidr_block}"
#   azs                     = "${var.azs}"
#   prefix                  = "public-${var.name}"
#   route_tables            = ["${aws_route_table.this_private.id}"]
#   subnet_count            = "${var.az_count}"
#   map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
#   tags                    = "${var.tags}"
# }
#
# output "private_subnets" {
#   value = "${module.private_subnets.ids}"
# }

