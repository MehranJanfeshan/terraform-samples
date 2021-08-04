provider "aws" {
  region = "eu-central-1"
}
terraform {
  required_version = ">=0.12"
}
resource "aws_subnet" "webserver" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block
}

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "${var.webserver_name} webserver"
  }
}