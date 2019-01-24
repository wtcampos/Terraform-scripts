data "aws_vpc_endpoint_service" "this_s3" {
  service = "s3"
}

resource "aws_vpc_endpoint" "this_s3" {
  vpc_id       = "${aws_vpc.this.id}"
  service_name = "${data.aws_vpc_endpoint_service.this_s3.service_name}"
  policy       = "${var.s3_endpoint_policy != "" ? var.s3_endpoint_policy : data.aws_iam_policy_document.this_endpoint_default.json}"
}

resource "aws_vpc_endpoint_route_table_association" "this_s3_public" {
  vpc_endpoint_id = "${aws_vpc_endpoint.this_s3.id}"
  route_table_id  = "${var.public_route_id}"
}

resource "aws_vpc_endpoint_route_table_association" "this_s3_private" {
  vpc_endpoint_id = "${aws_vpc_endpoint.this_s3.id}"
  route_table_id  = "${var.private_route_id}"

  count = "${var.az_count}"
}

output "s3_endpoint" {
  value = {
    id          = "${aws_vpc_endpoint.this_s3.id}"
    prefix_list = "${aws_vpc_endpoint.this_s3.prefix_list_id}"
  }
}
