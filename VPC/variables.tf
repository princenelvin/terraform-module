variable "vpc_cidr" {
  type = string
  default = "192.168.0.0/24"
}

variable "subnet_cidr" {
  type = string
  default = "192.168.0.0/24"
}

variable "subnet_name" {
  type = string
  default = "main-subnet"
}

variable "vpc_name" {
  type = string
  default = "main-vpc"
}


variable "local" {
  type = map(string)
  default = {
    "app" = "demo_app"
    "env" = "prod"
    "dept" = "engineering"
}
}
locals {
  local_vpc = "${var.local["app"]}-${var.local["env"]}-${var.local["dept"]}"
}