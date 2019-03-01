# Test order 3: shifting all protocols on policy; maintain swapped actions, ports

aviatrix_controller_ip          = "1.2.3.4"
aviatrix_controller_username    = "admin"
aviatrix_controller_password    = "password"

aviatrix_vpn_profile_name       = "profileName1"
aviatrix_vpn_profile_base_rule  = "allow_all"
aviatrix_vpn_profile_user_list  = ["user1"]

aviatrix_vpn_profile_action     = ["deny", "allow"] # can be referred to with [0] for allow, [1] for deny in vpn_user_profile.tf
aviatrix_vpn_profile_protocol   = ["dccp", "all", "tcp", "udp", "icmp", "sctp", "rdp"]
aviatrix_vpn_profile_port       = ["5555", "0:65535", "5577", "5588", "0:65535", "5600", "5611"]
aviatrix_vpn_profile_target     = ["10.0.0.0/32", "11.0.0.0/32", "12.0.0.0/32", "13.0.0.0/32", "14.0.0.0/32", "15.0.0.0/32", "16.0.0.0/32"]