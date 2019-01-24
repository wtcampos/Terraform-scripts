resource "aws_internet_gateway" "this" {
  vpc_id = "${var.vpc_id}"

  tags = "${merge(
    map("Name", var.name),
    var.tags
  )}"
}

output "id" {
  value = "${aws_internet_gateway.this.id}"
}
