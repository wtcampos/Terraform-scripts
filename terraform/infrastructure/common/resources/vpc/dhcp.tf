resource "aws_vpc_dhcp_options" "this" {
  domain_name          = "${var.domain_name}"
  domain_name_servers  = "${var.domain_name_servers}"
  ntp_servers          = "${var.ntp_servers}"
  netbios_name_servers = "${var.netbios_name_servers}"
  netbios_node_type    = "${var.netbios_node_type}"

  tags = "${merge(
    map("Name", var.name),
    var.tags
  )}"

  count = "${var.custom_dhcp_options_id == "" ? 1 : 0}"
}

resource "aws_vpc_dhcp_options_association" "this" {
  vpc_id          = "${aws_vpc.this.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.this.id}"

  count = "${var.custom_dhcp_options_id == "" ? 1 : 0}"
}

resource "aws_vpc_dhcp_options_association" "this_external" {
  vpc_id          = "${aws_vpc.this.id}"
  dhcp_options_id = "${var.custom_dhcp_options_id}"

  count = "${var.custom_dhcp_options_id != "" ? 1 : 0}"
}

output "dhcp_options" {
  value = {
    id                   = "${var.custom_dhcp_options_id == "" ? aws_vpc_dhcp_options.this.id : var.custom_dhcp_options_id}"
    domain_name_servers  = "${var.custom_dhcp_options_id == "" ? join(",", var.domain_name_servers) : ""}"
    ntp_servers          = "${var.custom_dhcp_options_id == "" ? join(",", var.ntp_servers) : ""}"
    netbios_name_servers = "${var.custom_dhcp_options_id == "" ? join(",", var.netbios_name_servers) : ""}"
    netbios_node_type    = "${var.custom_dhcp_options_id == "" ? var.netbios_node_type : ""}"
  }
}
