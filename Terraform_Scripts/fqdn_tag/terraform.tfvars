## initial creation
# icmp type/code is expected as 0-39/0-19 or None or "ping" in the port field
# protocol 'all' will default to 'all' regardless of input

##############################################

         aviatrix_fqdn_mode   = "white"
       aviatrix_fqdn_status   = "enabled"
          aviatrix_fqdn_tag   = "user-fqdn-TAG"
      aviatrix_gateway_list   = ["FQDN-GW"]

aviatrix_fqdn_domain          = ["facebook.com", "google.com", "twitter.com", "cnn.com"]
aviatrix_fqdn_protocol        = ["tcp", "udp", "udp", "udp"]
aviatrix_fqdn_port            = ["443", "480", "480", "480"]
