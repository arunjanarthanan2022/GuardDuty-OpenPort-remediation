# firewall_manager.tf

resource "aws_fms_admin_account" "main" {
  account_id = var.account_id
}

# Define Firewall Manager Security Policies for SSH Port Mitigation
resource "aws_fms_policy" "ssh_mitigation" {
  policy_name = "SSH-Port-Mitigation"
  security_service_policy_data {
    type = "WAFV2"

    firewall_policy {
      stateless_default_action {
        action = "DROP"
      }

      stateless_rule_group_reference {
        arn = var.ssh_rule_group_arn  # Specify your WAF rule ARN here
      }
    }
  }
}

# Define Firewall Manager Security Policies for MySQL Port Mitigation
resource "aws_fms_policy" "mysql_mitigation" {
  policy_name = "MySQL-Port-Mitigation"
  security_service_policy_data {
    type = "WAFV2"

    firewall_policy {
      stateless_default_action {
        action = "DROP"
      }

      stateless_rule_group_reference {
        arn = var.mysql_rule_group_arn  # Specify your WAF rule ARN here
      }
    }
  }
}
