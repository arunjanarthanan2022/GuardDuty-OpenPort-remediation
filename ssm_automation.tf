resource "aws_ssm_document" "remediate_ssh_ports" {
  name          = "RemediateSSHPorts"
  document_type = "Automation"
  content = jsonencode({
    schemaVersion = "2.2"
    description   = "Automatically block SSH port (22) access from 0.0.0.0/0"
    mainSteps = [
      {
        action = "aws:executeScript"
        name   = "runShellScript"
        inputs = {
          Runtime = "python3"
          Handler = "main"
          Script  = <<-EOT
          import boto3

          # Create EC2 client
          ec2 = boto3.client('ec2')

          # Describe security groups
          response = ec2.describe_security_groups(
              Filters=[{'Name': 'ip-permission.from-port', 'Values': ['22']}]
          )

          # Check each security group
          for sg in response['SecurityGroups']:
              for permission in sg['IpPermissions']:
                  if permission.get('FromPort') == 22:
                      for ip_range in permission.get('IpRanges', []):
                          if ip_range.get('CidrIp') == '0.0.0.0/0':
                              print(f"Found open SSH port 22 in Security Group: {sg['GroupId']}")
                              
                              # Revoke SSH access from 0.0.0.0/0
                              ec2.revoke_security_group_ingress(
                                  GroupId=sg['GroupId'],
                                  IpPermissions=[{
                                      'IpProtocol': 'tcp',
                                      'FromPort': 22,
                                      'ToPort': 22,
                                      'IpRanges': [{'CidrIp': '0.0.0.0/0'}]
                                  }]
                              )
                              print(f"SSH access from 0.0.0.0/0 revoked for Security Group: {sg['GroupId']}")
          EOT
        }
      }
    ]
  })
}
