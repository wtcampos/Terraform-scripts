resource "aws_subnet" "this" {
  vpc_id                  = "${var.vpc}"
  cidr_block              = "${element(var.cidr_blocks, count.index)}"
  availability_zone       = "${element(var.azs, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags                    = "${merge(
    map(
      "Name",
      "${var.prefix}-${substr(var.azs[count.index], -1, 1)}"
    ),
    var.tags
  )}"

  count                   = "${var.subnet_count}"
}

resource "aws_route_table_association" "this" {
  subnet_id       = "${element(aws_subnet.this.*.id, count.index)}"
  route_table_id  = "${element(var.route_tables, count.index)}"

  count           = "${var.subnet_count}"
}

output "ids" {
  description = "List of ids for the subnets"
  value = ["${aws_subnet.this.*.id}"]
}

output "azs" {
  description = "List of Availability Zones used by subnets"
  value = ["${aws_subnet.this.*.availability_zone}"]
}

output "cidr_blocks" {
  description = "List of CIDR blocks used by subnets"
  value = ["${aws_subnet.this.*.cidr_block}"]
}

output "route_table_associations" {
  description = "List of route tables associations ids"
  value = ["${aws_route_table_association.this.*.id}"]
}

output "vpc" {
  description = "VPC which the subnets belongs"
  value = "${var.vpc}"
}
