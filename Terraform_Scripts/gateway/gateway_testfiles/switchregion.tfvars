# Test order 2: change region and vpc id and swap back to original account name

aviatrix_controller_ip          = "1.2.3.4"
aviatrix_controller_username    = "admin"
aviatrix_controller_password    = "password"
##############################################

aviatrix_cloud_account_name     = "PrimaryAccessAccount"
aviatrix_cloud_type_aws = 1
aviatrix_gateway_name   = ["testGW1"] # case 1
# aviatrix_gateway_name  = ["testGW1", "testGW2"] # comment out either gateway_name if testing 1 or 2

##############################################
## Singular gateway for faster testing
##############################################
aws_vpc_id = ["vpc-def456"]
aws_region = ["us-west-1"]
aws_vpc_public_cidr = ["10.0.0.0/24"]
aws_instance = ["t2.micro"]
aws_gateway_tag_list = ["Purpose:Test TF GW1"]

## Testing 2 GW
# aws_vpc_id = ["vpc-def456", "vpc-def456"]
# aws_region = ["us-west-1", "us-west-1"]
# aws_vpc_public_cidr = ["10.0.0.0/24", "10.0.0.0/24"]
# aws_instance = ["t2.micro", "t2.micro"]
# aws_gateway_tag_list = ["Purpose:Test TF GW1", "Purpose:Test TF GW2"]