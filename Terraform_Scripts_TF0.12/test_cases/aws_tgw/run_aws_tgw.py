"""
run_aws_tgw.py

Test case for Aviatrix's AWS TGW + TGW VPN Conn Terraform resource/ use-case

- note various placeholders that must be updated:
    - filepath for terraform_fx.py
    - create/ import/ update/ destroy test functions and respective arguments
    - update "#" in "avx_ip_#", "avx_user_#", "avx_pass_#" accordingly
- place xxx.py in respective test_cases/xxx/ directory
"""

import os

import sys
sys.path.insert(1, '/var/lib/jenkins/workspace/Terraform-Regression/py_libs')
import terraform_fx as tf

import logging
import logging.handlers
import time

TIMESTR = time.strftime("%Y-%m-%d")
LOGLEVEL = logging.DEBUG
FORMAT = "%(asctime)s - %(levelname)s - %(message)s"
DATEFORMAT = "%d-%b-%y %H:%M:%S"
logging.basicConfig(level=LOGLEVEL,
                    format=FORMAT,
                    datefmt=DATEFORMAT,
                    handlers=[
                        logging.FileHandler(filename=os.getcwd() + "/logs/" + TIMESTR + "_regression_result.log"),
                        logging.StreamHandler()
                    ])
log = logging.getLogger()

log.info("\n")
log.info("============================================================")
log.debug("RUNNING STAGE: " + str(os.path.split(os.getcwd())[1]).upper())
log.info("============================================================")
log.info("Steps to perform:")
log.info("      1. Set up environment variables/ credentials")
log.info("      2. Create Aviatrix AWS TGW solution")
log.info("      3. Perform terraform import to identify deltas")
log.info("      4. Verify TGW Security Domain connection functionality")
log.info("      5. Verify TGW VPC attachment functionality")
log.info("      6. Perform import tests on TGW VPN conn resource")
log.info("      7. Tear down infrastructure\n")

try:
    log.info("Setting environment...")
    log.debug("     placeholder_ip: %s", str(os.environ["AVIATRIX_CONTROLLER_IP"]))
    log.debug("     placeholder_user: %s", str(os.environ["AVIATRIX_USERNAME"]))
    log.debug("     placeholder_pass: %s", str(os.environ["AVIATRIX_PASSWORD"]))
    avx_controller_ip = os.environ["avx_ip_1"]
    avx_controller_user = os.environ["avx_user_1"]
    avx_controller_pass = os.environ["avx_pass_1"]
    log.info("Setting new variable values as follows...")
    log.debug("     avx_controller_ip: %s", avx_controller_ip)
    log.debug("     avx_controller_user: %s", avx_controller_user)
    log.debug("     avx_controller_pass: %s", avx_controller_pass)
    os.environ["AVIATRIX_CONTROLLER_IP"] = avx_controller_ip
    os.environ["AVIATRIX_USERNAME"] = avx_controller_user
    os.environ["AVIATRIX_PASSWORD"] = avx_controller_pass
except Exception as err:
    log.exception(str(err))
    log.info("-------------------- RESULT --------------------")
    log.error("     Failed to properly set environment credentials!")
    sys.exit(1)
else:
    log.info("-------------------- RESULT --------------------")
    log.info("      Set environment credentials: PASS\n")


try:
    log.info("Creating infrastructure...")
    tf.create_verify()
except tf.subprocess.CalledProcessError as err:
    log.exception(err.stderr.decode())
    log.info("-------------------- RESULT --------------------")
    log.error("     create_verify(): FAIL\n")
    sys.exit(1)
else:
    log.info("-------------------- RESULT --------------------")
    log.info("      create_verify(): PASS\n")


try:
    log.info("Verifying import functionality...")
    log.debug("     Importing TGW...")
    tf.import_test("aws_tgw", "test_aws_tgw")
    log.debug("     Importing TGW Transit Gateway Attachment...")
    tf.import_test("aws_tgw_transit_gateway_attachment", "tgw_transit_att")
except tf.subprocess.CalledProcessError as err:
    log.exception(err.stderr.decode())
    log.info("-------------------- RESULT --------------------")
    log.error("     import_test(): FAIL\n")
    sys.exit(1)
else:
    log.info("-------------------- RESULT --------------------")
    log.info("      import_test(): PASS\n")


try:
    log.info("Verifying update functionality...")
    log.debug("     switchConnectDomain: Switching around which domains to be connected within the TGW...")
    tf.update_test("switchConnectDomain")
    log.debug("     switchVPC: Updating which VPCs to be attached to the TGW...")
    tf.update_test("switchVPC")
    # log.debug("     updateCustomRoutes: Updating customized Spoke VPC routes...")
    # tf.update_test("updateCustomRoutes")
    # log.debug("     enableLocalRouteProp: Enabling admin to propagate the VPC CIDR to the security domain/TGW route table that it is being attached to...")
    # tf.update_test("enableLocalRouteProp")
except tf.subprocess.CalledProcessError as err:
    log.exception(err.stderr.decode())
    log.info("-------------------- RESULT --------------------")
    log.error("     update_test(): FAIL\n")
    sys.exit(1)
else:
    log.info("-------------------- RESULT --------------------")
    log.info("      update_test(): PASS\n")


log.info(str(os.path.split(os.getcwd())[1]).upper() + " will not be destroyed until aws_tgw_vpn_conn concludes...")
log.info("-------------------- RESULT --------------------")
log.info("     destroy_test(): SKIPPED\n")


log.info("Continuing to AWS TGW VPN connection testing...")
log.info("\n")
log.info("============================================================")
log.debug("RUNNING STAGE: AWS_TGW_VPN_CONN")
log.info("============================================================")


try:
    log.info("Verifying import functionality...")
    log.debug("     Importing dynamic TGW VPN conn...")
    tf.import_test("aws_tgw_vpn_conn", "test_aws_tgw_vpn_conn1", "switchVPC") # note last state was from switchVPC.tfvars
    log.debug("     Importing static TGW VPN conn...")
    tf.import_test("aws_tgw_vpn_conn", "test_aws_tgw_vpn_conn2", "switchVPC")
except tf.subprocess.CalledProcessError as err:
    log.exception(err.stderr.decode())
    log.info("-------------------- RESULT --------------------")
    log.error("     import_test(): FAIL\n")
    sys.exit(1)
else:
    log.info("-------------------- RESULT --------------------")
    log.info("      import_test(): PASS\n")


try:
    log.info("Verifying update functionality...")
    log.debug("     updateLearnedCIDRApproval: Disable approval requirement for Learned CIDRs...")
    tf.update_test("updateLearnedCIDRApproval")
except tf.subprocess.CalledProcessError as err:
    log.exception(err.stderr.decode())
    log.info("-------------------- RESULT --------------------")
    log.error("     update_test(): FAIL\n")
    sys.exit(1)
else:
    log.info("-------------------- RESULT --------------------")
    log.info("      update_test(): PASS\n")


try:
    log.info("Verifying destroy functionality for both TGW and TGW VPN Conn...")
    tf.destroy_test()
except tf.subprocess.CalledProcessError as err:
    log.exception(err.stderr.decode())
    log.info("-------------------- RESULT --------------------")
    log.error("     destroy_test(): FAIL\n")
    sys.exit(1)
else:
    log.info("-------------------- RESULT --------------------")
    log.info("      destroy_test(): PASS\n")
