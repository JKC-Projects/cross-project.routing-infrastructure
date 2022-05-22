variable "fqdn" {
  type        = string
  description = "The FQDN of the service that we're creating an ALB target group and ALB listener for."
  required    = true
}

variable "project" {
  type        = string
  description = "The project name for the target group we're creating"
  required    = true
}

variable "application" {
  type        = string
  description = "The application name for the target group we're creating"
  required    = true
}

variable "target_group_target_type" {
  type        = string
  description = "The target type for the created target group"
  default     = "ip"

  validation {
    condition     = contains(["ip", "lambda", "instance"], var.target_group_target_type)
    error_message = "Valid values for var.target_group_target_type are [\"ip\",\"lambda\",\"instance\"]."
  }
}

variable "vpc_id" {
  type        = string
  description = "The VPC IP of the ALB"
  required    = true
}

variable "load_balancer_arn" {
  type        = string
  description = "The ARN of the ALB that we are creating listeners and target groups for."
  required    = true
}