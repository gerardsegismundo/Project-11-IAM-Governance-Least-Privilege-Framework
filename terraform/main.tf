terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "iam_governance" {
  source = "./modules/iam_governance"

  role_name                    = var.role_name
  role_description             = var.role_description
  cross_account_trusted_accounts = var.cross_account_trusted_accounts
  permission_boundary_policy_name = var.permission_boundary_policy_name
}
