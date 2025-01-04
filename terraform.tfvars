# terraform.tfvars

aws_region         = "us-east-1"
account_id         = "your-account-id"  # Replace with your AWS account ID
admin_account_id   = "your-admin-account-id"  # Replace with the admin account ID
ssh_rule_group_arn = "arn:aws:wafv2:us-east-1:aws:rulegroup/AllowOnlySSHfromSpecificIPs"
mysql_rule_group_arn = "arn:aws:wafv2:us-east-1:aws:rulegroup/AllowOnlyMySQLfromSpecificIPs"
