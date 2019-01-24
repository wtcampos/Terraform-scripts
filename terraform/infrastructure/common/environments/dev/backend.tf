terraform {
  required_version = ">=0.10.8"

  backend "s3" {
    bucket = "261567712600-tfstate"
    key    = "terraform/common.tfstate"
    region = "us-east-1"
  }
}
