variable "myregion" {
  type    = list(string)
  default = ["us-east-1", "us-east-2", "us-west-1"]
}

variable "inst-type" {
  type = map(any)
  default = {
    dev     = "t2.micro"
    staging = "t2.medium"
    prod    = "t2.large"
  }
}

variable "ami" {
  type    = string
  default = "ami-080c09858e04800a1"
}

variable "s3" {
  type    = string
  default = "dera-dev-s3-bucket"
}

locals {
  instance_name = "${var.inst-type["dev"]}-${var.s3}-${var.myregion[1]}"
}
