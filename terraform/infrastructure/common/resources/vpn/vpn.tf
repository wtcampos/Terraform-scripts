resource "aws_vpn_gateway" "this" {
  vpc_id = "${var.vpc_id}"

  tags = "${merge(
    map("Name", var.name),
    var.tags
  )}"
}

output "vpn_gateway_id" {
  value = "${aws_vpn_gateway.this.id}"
}

resource "aws_customer_gateway" "this" {
  bgp_asn    = 65000
  ip_address = "143.0.12.253"
  type       = "ipsec.1"

  tags = "${merge(
    map("Name", var.name),
    var.tags
  )}"
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = "${aws_vpn_gateway.this.id}"
  customer_gateway_id = "${aws_customer_gateway.this.id}"
  type                = "ipsec.1"
  static_routes_only  = true

  tags = "${merge(
    map("Name", var.name),
    var.tags
  )}"
}

# resource "aws_vpc_peering_connection" "this" {
#   peer_owner_id = "${var.peer_owner_id}"
#   peer_vpc_id   = "${var.peer_vpc_id}"
#   vpc_id        = "${var.vpc_id}"
#   auto_accept   = true
#
#   tags {
#     Name = "emb-qas to emb-shared"
#   }
# }
#
# output "vpc_peering_id" {
#   value = "${aws_vpc_peering_connection.this.id}"
# }

