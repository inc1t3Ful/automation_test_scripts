variable "aviatrix_controller_ip" {}
variable "aviatrix_controller_username" {}
variable "aviatrix_controller_password" {}

variable "aws_vpc_id" {}
variable "aviatrix_gateway_name" {}
variable "aviatrix_vpn_user_name" {
  type = "map"
}
variable "aviatrix_vpn_user_email" {
  type = "map"
}
variable "aviatrix_vpn_user_saml" {
  type = "list"
}
