variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "trusted_ips" {
  description = "List of trusted IPs for SSH access"
  type        = list(string)
  default     = ["1.2.3.4/32"]  # Example trusted IP for SSH access
}

variable "remediation_sg_id" {
  description = "Security group ID to apply the remediations"
  type        = string
}
