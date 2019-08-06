# Manage Aviatrix Transit Gateway with Firewall Network feature

resource "aviatrix_vpc" "firenet_vpc" {
  cloud_type = 1
  account_name = "AWSAccess"
  region = "us-west-1"
  name = "firenetVPC"
  cidr = "15.15.15.0/24"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = true
}

resource "aviatrix_transit_vpc" "firenet_transit_gw" {
  cloud_type          = 1
  account_name        = "AWSAccess"
  gw_name             = "firenetTransitGW"
  vpc_id              = aviatrix_vpc.firenet_vpc.vpc_id
  vpc_reg             = "us-west-1"
  vpc_size            = "c5.xlarge"
  subnet              = aviatrix_vpc.firenet_vpc.subnets.1.cidr
  ha_subnet           = aviatrix_vpc.firenet_vpc.subnets.2.cidr
  ha_gw_size          = "c5.xlarge"

  enable_nat                  = "no"
  enable_firenet_interfaces   = var.toggle_firenet
  enable_hybrid_connection    = true
  connected_transit           = "yes"
  depends_on                  = ["aviatrix_vpc.firenet_vpc"]
}
