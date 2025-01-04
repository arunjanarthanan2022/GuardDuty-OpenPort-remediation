# main.tf

provider "aws" {
  region = var.aws_region
}

# Include other Terraform configuration files
module "guardduty" {
  source = "./guardduty.tf"
}

module "firewall_manager" {
  source = "./firewall_manager.tf"
}

module "integration" {
  source = "./integration.tf"
}
