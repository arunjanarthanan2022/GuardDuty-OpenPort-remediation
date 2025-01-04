**Setup Terraform Environment for GuardDuty & Firewall Manager**

**Prerequisites**
**1.	Terraform: Ensure Terraform is installed. For macOS, use:**

brew install terraform

**Verify the installation:**

terraform -v

**2.	AWS CLI: Install and configure AWS CLI:**
aws configure

**Configure Terraform Variables**

**1.	Create a terraform.tfvars file to specify values for variables:**
hcl
Copy code
aws_region         = "us-east-1"

account_id         = "your-aws-account-id"

admin_account_id   = "your-admin-account-id"

ssh_rule_group_arn = "arn:aws:wafv2:us-east-1:aws:rulegroup/AllowOnlySSHfromSpecificIPs"

mysql_rule_group_arn = "arn:aws:wafv2:us-east-1:aws:rulegroup/AllowOnlyMySQLfromSpecificIPs"

**3.	Replace the placeholders with your actual AWS Account IDs and WAF rule ARNs.**
 
**Run Terraform

**1.	Initialize the Terraform working directory:****

terraform init

**2.	Validate the configuration:**

terraform validate

**3.	Preview the changes:**

terraform plan

**4.	Apply the configuration:**

terraform apply

Confirm with yes when prompted.

![image](https://github.com/user-attachments/assets/c83da3ef-d75d-4ff0-a792-96d334504b62)
