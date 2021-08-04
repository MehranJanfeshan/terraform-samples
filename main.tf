provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  region = "eu-central-2"
  alias = "east"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

module "will_webserver_1" {
  source = "./modules/webservers"
  ami = "ami-0453cb7b5f2b7fca2"
  cidr_block = "10.0.0.0/16"
  instance_type = "t2.micro"
  vpc_id = aws_vpc.main.id
  webserver_name = "ICT"
}

module "will_webserver_2" {
  source = "./modules/webservers"
  providers = {
    aws = aws.east
  }
  ami = "ami-0453cb7b5f2b7fca2"
  cidr_block = "10.0.0.0/16"
  instance_type = "t2.micro"
  vpc_id = aws_vpc.main.id
  webserver_name = "ICT"
}

output "instance_data" {
  value = module.will_webserver_1.webserver["id"]
}