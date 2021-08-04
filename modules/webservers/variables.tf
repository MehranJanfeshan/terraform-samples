variable "vpc_id" {
  type = string
  description = "Vpc Id"
}

variable "cidr_block" {
  type = string
  description = "cidr_block of VPC"
}

variable "ami" {
  type = string
  description = "ami of EC2 instance"
}

variable "instance_type" {
  type = string
  description = "instance_type of EC2 instance"
}

variable "webserver_name" {
  type = string
  description = "name of EC2 instance"
}