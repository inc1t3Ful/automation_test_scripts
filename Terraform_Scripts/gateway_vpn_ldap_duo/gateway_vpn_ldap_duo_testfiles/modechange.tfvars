## Test case 0. Change otp mode and/or change enable_ldap
## Please see Mantis id = 8142

##############################################

                       aws_region = "us-east-1"
                       aws_vpc_id = "vpc-abc123"
                     aws_instance = "t2.micro"
              aws_vpc_public_cidr = "10.0.0.0/24"

     aviatrix_cloud_account_name  = "Temp-AWS-AccessAccount"
           aviatrix_gateway_name  = "myAviatrix-gateway-VPN-ldap-duo"
          aviatrix_cloud_type_aws = 1

              aviatrix_vpn_access = "yes"
                aviatrix_vpn_cidr = "192.168.230.0/24"
                 aviatrix_vpn_elb = "yes"
        aviatrix_vpn_split_tunnel = "yes"
##############################################
## OTP Mode edit here:
            aviatrix_vpn_otp_mode = "1" # random invalid input
            # aviatrix_vpn_otp_mode = "3" # Okta (which would make Duo parameters invalid and Okta parameters required)
##############################################
 aviatrix_vpn_duo_integration_key = "DDDDDDDDDDDDDDDDDDY6"
      aviatrix_vpn_duo_secret_key = "QqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqXN2zwQ"
    aviatrix_vpn_duo_api_hostname = "api-11111111.duosecurity.com"
       aviatrix_vpn_duo_push_mode = "auto"

##############################################
## LDAP enable edit here:
         # aviatrix_vpn_ldap_enable = "yes"
         aviatrix_vpn_ldap_enable = "no" # Comment this out if you want to test only OTP mode changes; uncomment the "yes"
##############################################
         aviatrix_vpn_ldap_server = "1.2.3.4:389"
        aviatrix_vpn_ldap_bind_dn = "TTTTTTTTTEST\\Administrator"
       aviatrix_vpn_ldap_password = "myLDAPpassword123"
        aviatrix_vpn_ldap_base_dn = "DC=aviatrixtest, DC=com"
aviatrix_vpn_ldap_username_attribute = "auto"
