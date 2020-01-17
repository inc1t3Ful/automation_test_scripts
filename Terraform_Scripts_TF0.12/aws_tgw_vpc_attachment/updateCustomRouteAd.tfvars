## Test case 6: update customized routes to advertise

## vpc-attachment-related
tgw_sec_domain            = "SDN2"

customized_routes = "10.10.0.0/16,10.12.0.0/16"
disable_local_route_propagation = true

adv_subnets = "subnet-0f45ddd6547d91dec"
adv_rtb     = "rtb-08d346d66041a752d"
adv_custom_route_advertisement = "10.70.0.0/24"