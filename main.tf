provider "aws" {
  region = var.region
}

module "guardduty" {
  source = "./guardduty.tf"
}

module "cloudwatch_events" {
  source = "./cloudwatch_events.tf"
}

module "ssm_automation" {
  source = "./ssm_automation.tf"
}

module "sns_notifications" {
  source = "./sns_notifications.tf"
}

module "security_groups" {
  source      = "./security_groups.tf"
  trusted_ips = var.trusted_ips
}
