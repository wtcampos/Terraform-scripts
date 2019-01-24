resource "aws_route53_zone" "this" {
  name    = "${var.domain_name}"
  comment = "${var.hosted_zone_comment}"
  vpc_id  = "${aws_vpc.this.id}"

  force_destroy = false

  tags = "${merge(
    map("Name", var.name),
    var.tags
  )}"

  count = "${var.custom_route53_zone_id == "" ? 1 : 0}"
}

resource "aws_route53_zone_association" "this_custom" {
  zone_id = "${var.custom_route53_zone_id}"
  vpc_id  = "${aws_vpc.this.id}"

  count = "${var.custom_route53_zone_id != "" ? 1 : 0}"
}
