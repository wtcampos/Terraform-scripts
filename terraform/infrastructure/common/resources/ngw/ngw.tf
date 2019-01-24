resource "aws_nat_gateway" "ngw" {
  allocation_id = "${var.eip_id}"
  subnet_id     = "${var.subnet_id}"

  tags = "${merge(
    map ("Name", "${var.name}") ,
    var.tags
  )}"
}

output "id" {
  value = "${aws_nat_gateway.ngw.id}"
}
