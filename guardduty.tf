# guardduty.tf

resource "aws_guardduty_detector" "main" {
  enable = true
}

# Optional: Enable GuardDuty for the entire organization (if managing multiple accounts)
resource "aws_guardduty_organization_admin_account" "org_admin" {
  admin_account_id = var.admin_account_id
}

# SNS Topic for GuardDuty Findings Notifications
resource "aws_sns_topic" "guardduty_topic" {
  name = "GuardDutyFindingsTopic"
}

resource "aws_guardduty_publishing_destination" "sns_publish" {
  detector_id      = aws_guardduty_detector.main.id
  destination_arn  = aws_sns_topic.guardduty_topic.arn
  publishing_status = "ENABLED"
}
