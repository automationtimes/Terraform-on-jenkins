variable "region" {
  default = "us-east-2"
}

variable "ami_id" {
  type = "map"

  default = {
    us-east-2    = "ami-0fb653ca2d3203ac1"
  }
}
