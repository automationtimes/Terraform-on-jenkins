terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      region  = "${var.region}"
      source = "hashicorp/aws"
    }
  }
}