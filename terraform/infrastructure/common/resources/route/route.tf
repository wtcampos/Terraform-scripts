resource "aws_route_table" "this" {
  vpc_id = "${var.vpc_id}"

  tags = "${merge(
    map ("Name", "${var.name}") ,
    var.tags
  )}"
}

output "route_table_id" {
  value = "${aws_route_table.this.id}"
}
