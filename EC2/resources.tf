resource "aws_instance" "new-tf-instance" {
  ami           = data.aws_ami.amazon-ami.id
  instance_type = var.inst-type["prod"]
  # user_data     = file($.abspath(/ec2) "httpd.sh")
  # user_data = data.template_file.user_data
  subnet_id     = module.vpc.subnet_id
  # depends_on    = [aws_vpc.pro-vpc]
tags = {
  Name = local.instance_name
}
}

resource "aws_eip" "pro-eip" {
  instance = aws_instance.new-tf-instance.id
}

resource "aws_s3_bucket" "dera-demo-s3" {
  bucket = var.s3

  tags = {
    Name        = "Dera bucket"
    Environment = "Dev"
  }

}

