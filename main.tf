# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "aft" {
  source                      = "github.com/aws-ia/terraform-aws-control_tower_account_factory"
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region

  vcs_provider                                  = "github"
  account_request_repo_name                     = "${var.github_username}/terraform-aft-account-request-02"
  account_provisioning_customizations_repo_name = "${var.github_username}/terraform-aft-account-provisioning-customizations-05"
  global_customizations_repo_name               = "${var.github_username}/terraform-aft-global-customizations-03"
  account_customizations_repo_name              = "${var.github_username}/terraform-aft-account-customizations-04"

  # Optional Parameters
  aft_feature_delete_default_vpcs_enabled = false
  aft_feature_cloudtrail_data_events      = false
  aft_feature_enterprise_support          = false
  aft_vpc_endpoints                       = false
}

data "aws_caller_identity" "deploy-account" {}
