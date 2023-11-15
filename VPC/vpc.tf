resource "aws_vpc" "pro-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
   # Name = var.vpc_name
   Name = local.local_vpc
  }
}

resource "aws_subnet" "pro-subnet" {
  vpc_id     = aws_vpc.pro-vpc.id
  cidr_block = var.subnet_cidr
  tags = {
    Name = var.subnet_name
  }
}
resource "aws_internet_gateway" "demo_gw" {
  vpc_id = aws_vpc.pro-vpc.id
}
/*
output "subnet_id_output" {
    value = "aws_subnet.pro-subnet.id"
}
*/
output "subnet_id" {
    value = aws_subnet.pro-subnet.id
}