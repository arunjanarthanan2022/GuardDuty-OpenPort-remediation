# integration.tf

# Attach the SSH mitigation policy to EC2 instances
resource "aws_fms_policy_attachment" "ssh_attachment" {
  policy_id      = aws_fms_policy.ssh_mitigation.id
  resource_type  = "AWS::EC2::Instance"  # Modify this for specific resources
}

# Attach the MySQL mitigation policy to RDS databases
resource "aws_fms_policy_attachment" "mysql_attachment" {
  policy_id      = aws_fms_policy.mysql_mitigation.id
  resource_type  = "AWS::RDS::DBInstance"  # Modify for other resources as needed
}
