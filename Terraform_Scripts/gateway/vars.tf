variable "aviatrix_cloud_account_name" {}
variable "aviatrix_cloud_type_aws" {}
variable "aviatrix_gateway_name" {
  type = "list"
}

variable "aws_region" {
  type = "list"
}
variable "aws_vpc_id" {
  type = "list"
}
variable "aws_instance" {
  type = "list"
}
variable "aws_vpc_public_cidr" {
  type = "list"
}
variable "aws_gateway_tag_list" {
  type = "list"
}
