# variables.tf

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "account_id" {
  description = "AWS account ID for Firewall Manager"
  type        = string
}

variable "admin_account_id" {
  description = "AWS account ID for GuardDuty organization admin"
  type        = string
}

variable "ssh_rule_group_arn" {
  description = "ARN of the WAF rule group for SSH access"
  type        = string
}

variable "mysql_rule_group_arn" {
  description = "ARN of the WAF rule group for MySQL access"
  type        = string
}
