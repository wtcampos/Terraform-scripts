locals {
  cidr_block_bits = "${replace(var.cidr_block, "/^[0-9.]+./", "")}"
  vpc_network_address = "${cidrhost(var.cidr_block, 0)}"
  vpc_network_mask = "${cidrnetmask(aws_vpc.this.cidr_block)}"
}

// If no enpoint custom policy is passed this one is used
data "aws_iam_policy_document" "this_endpoint_default" {
  statement {
    sid       = "AllowAll"
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}
