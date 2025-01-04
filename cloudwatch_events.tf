resource "aws_cloudwatch_event_rule" "this" {
  name        = "ssh-open-port-detection"
  description = "Detects security group changes with open SSH ports to 0.0.0.0/0"
  event_pattern = jsonencode({
    "source" : ["aws.ec2"],
    "detail-type" : ["AWS API Call via CloudTrail"],
    "detail": {
      "eventSource": ["ec2.amazonaws.com"],
      "eventName"  : ["AuthorizeSecurityGroupIngress"],
      "requestParameters": {
        "ipPermissions": {
          "fromPort": [22],
          "toPort"  : [22],
          "ipRanges": {
            "cidrIp": ["0.0.0.0/0"]
          }
        }
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "this" {
  rule      = aws_cloudwatch_event_rule.this.name
  target_id = "ssm-automation"
  arn       = aws_ssm_document.remediate_ssh_ports.arn
}

resource "aws_cloudwatch_event_permission" "this" {
  principal = "ssm.amazonaws.com"
  action    = "events:PutEvents"
  statement_id = "ssm-access"
  event_bus_name = aws_cloudwatch_event_rule.this.event_bus_name
}
