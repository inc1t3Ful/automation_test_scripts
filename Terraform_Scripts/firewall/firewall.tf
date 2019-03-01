# initial creation (without icmp)

# note: use 0 or 1 for log_enable for on or off respectively
# note: use 0 or 1 for allow_deny for allow or deny respectively
# comment out sections to test different cases (everything), (ICMP protocol) or ("ALL")

##############################################
## Case 1. Create every type of protocol rule (except ICMP)
# Expected result: the "all" protocol should fail and yield "Port must be blank/empty"
# Reality: *apply complete* (aka successful)
# Please see Mantis: id=8064 for the "All" issue
##############################################
resource "aviatrix_firewall" "test_firewall" {
  gw_name = "${var.aviatrix_gateway_name}"
  base_allow_deny = "${var.aviatrix_firewall_base_policy}"
  base_log_enable = "${var.aviatrix_firewall_packet_logging}"
  policy = [
    {
      protocol = "${var.aviatrix_firewall_policy_protocol[0]}"
      src_ip = "${var.aviatrix_firewall_policy_source_ip[0]}"
      log_enable = "${var.aviatrix_firewall_policy_log_enable[0]}"
      dst_ip = "${var.aviatrix_firewall_policy_destination_ip[0]}"
      allow_deny = "${var.aviatrix_firewall_policy_action[0]}"
      port = "${var.aviatrix_firewall_policy_port[0]}"
    },
    {
      protocol = "${var.aviatrix_firewall_policy_protocol[1]}"
      src_ip = "${var.aviatrix_firewall_policy_source_ip[1]}"
      log_enable = "${var.aviatrix_firewall_policy_log_enable[1]}"
      dst_ip = "${var.aviatrix_firewall_policy_destination_ip[1]}"
      allow_deny = "${var.aviatrix_firewall_policy_action[1]}"
      port = "${var.aviatrix_firewall_policy_port[1]}"
    },
    {
      protocol = "${var.aviatrix_firewall_policy_protocol[2]}"
      src_ip = "${var.aviatrix_firewall_policy_source_ip[2]}"
      log_enable = "${var.aviatrix_firewall_policy_log_enable[1]}"
      dst_ip = "${var.aviatrix_firewall_policy_destination_ip[2]}"
      allow_deny = "${var.aviatrix_firewall_policy_action[0]}"
      port = "${var.aviatrix_firewall_policy_port[2]}"
    },
    {
      protocol = "${var.aviatrix_firewall_policy_protocol[3]}"
      src_ip = "${var.aviatrix_firewall_policy_source_ip[3]}"
      log_enable = "${var.aviatrix_firewall_policy_log_enable[1]}"
      dst_ip = "${var.aviatrix_firewall_policy_destination_ip[3]}"
      allow_deny = "${var.aviatrix_firewall_policy_action[1]}"
      port = "${var.aviatrix_firewall_policy_port[3]}"
    },
    {
      protocol = "${var.aviatrix_firewall_policy_protocol[4]}"
      src_ip = "${var.aviatrix_firewall_policy_source_ip[4]}"
      log_enable = "${var.aviatrix_firewall_policy_log_enable[1]}"
      dst_ip = "${var.aviatrix_firewall_policy_destination_ip[4]}"
      allow_deny = "${var.aviatrix_firewall_policy_action[1]}"
      port = "${var.aviatrix_firewall_policy_port[4]}"
    },
    {
      protocol = "${var.aviatrix_firewall_policy_protocol[5]}"
      src_ip = "${var.aviatrix_firewall_policy_source_ip[5]}"
      log_enable = "${var.aviatrix_firewall_policy_log_enable[1]}"
      dst_ip = "${var.aviatrix_firewall_policy_destination_ip[5]}"
      allow_deny = "${var.aviatrix_firewall_policy_action[1]}"
      port = "${var.aviatrix_firewall_policy_port[5]}"
    }
  ]
}

##############################################
# Case 2. ICMP ONLY; run along with icmponly.tfvars
# Expected result: < depends on the variables passed in icmponly.tfvars >
# Please see Mantis: id=8063
##############################################
# resource "aviatrix_firewall" "test_firewall" {
#   gw_name = "${var.aviatrix_gateway_name}"
#   base_allow_deny = "${var.aviatrix_firewall_base_policy}"
#   base_log_enable = "${var.aviatrix_firewall_packet_logging}"
#   policy = [
#     {
#       protocol = "${var.aviatrix_firewall_policy_protocol[0]}"
#       src_ip = "${var.aviatrix_firewall_policy_source_ip[0]}"
#       log_enable = "${var.aviatrix_firewall_policy_log_enable[0]}"
#       dst_ip = "${var.aviatrix_firewall_policy_destination_ip[0]}"
#       allow_deny = "${var.aviatrix_firewall_policy_action[0]}"
#       port = "${var.aviatrix_firewall_policy_port[0]}"
#     }
#   ]
# }

##############################################
## Case 3. ALL ONLY;
# Expected result: "Port Range" must be blank/empty; Assuming running with terraform.tfvars
# Reality: *apply complete* (aka successful)
# Please see Mantis: id=8064
##############################################
# resource "aviatrix_firewall" "test_firewall" {
#   gw_name = "${var.aviatrix_gateway_name}"
#   base_allow_deny = "${var.aviatrix_firewall_base_policy}"
#   base_log_enable = "${var.aviatrix_firewall_packet_logging}"
#   policy = [
#     {
#       protocol = "${var.aviatrix_firewall_policy_protocol[5]}"
#       src_ip = "${var.aviatrix_firewall_policy_source_ip[5]}"
#       log_enable = "${var.aviatrix_firewall_policy_log_enable[0]}"
#       dst_ip = "${var.aviatrix_firewall_policy_destination_ip[5]}"
#       allow_deny = "${var.aviatrix_firewall_policy_action[0]}"
#       port = "${var.aviatrix_firewall_policy_port[5]}"
#     }
#   ]
# }