module "ngw" {
  source    = "../../resources/ngw"
  name      = "ngw-${local.environment}"
  eip_id    = "${aws_eip.ngw.id}"
  subnet_id = "${module.public_subnets.ids[1]}"
  tags      = "${local.tags}"
}

resource "aws_eip" "ngw" {
  vpc = true

  tags = "${merge(
    map ("Name", "ngw") ,
    "${local.tags}"
  )}"
}
