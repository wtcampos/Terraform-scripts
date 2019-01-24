module "igw" {
  source = "../../resources/igw"
  vpc_id = "${module.vpc.vpc["id"]}"
  tags   = "${local.tags}"
  name   = "IGW-${local.environment}"
}
