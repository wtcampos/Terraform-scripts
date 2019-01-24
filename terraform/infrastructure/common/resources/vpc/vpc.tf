resource "aws_vpc" "this" {
  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  // Classic link is always disabled
  enable_classiclink             = false
  enable_classiclink_dns_support = false

  tags = "${merge(
    map("Name", var.name),
    var.tags
  )}"
}

output "vpc" {
  value = {
    id              = "${aws_vpc.this.id}"
    cidr_block      = "${aws_vpc.this.cidr_block}"
    cidr_block_bits = "${local.cidr_block_bits}"

    # private_zone       = "${var.custom_route53_zone_id == "" ? aws_route53_zone.this.zone_id : var.custom_route53_zone_id}"
    # igw                = "${aws_internet_gateway.this.id}"
    # public_route_table = "${aws_route_table.this_public.id}"
    instance_tenancy = "${aws_vpc.this.instance_tenancy}"

    main_route_table_id       = "${aws_vpc.this.main_route_table_id}"
    default_network_acl_id    = "${aws_vpc.this.default_network_acl_id}"
    default_security_group_id = "${aws_vpc.this.default_security_group_id}"
    default_route_table_id    = "${aws_vpc.this.default_route_table_id}"
    network_address           = "${local.vpc_network_address}"
    network_mask              = "${local.vpc_network_mask}"
  }
}
