variable "aws_region" {
  description = "Specifies the AWS region where the resources will be deployed. Example: ''"
  type = string
}

variable "environment" {
  description = "Deployment environment name, such as 'dev', 'test', 'prod'. This categorizes the Network resources by their usage stage"
  type        = string
  default     = "dev"
}

variable "departament_name" {
  description = "Name of the department responsable for the VPC, e.g, 'engineering', 'marketing', helps in identify ownership of the resources."
  type = string
  default = "engineering"
}

variable "allowed_ip" {
    description = "IP Address/CIDR block to SSH into the bastion host. Use caution to restrict access to know IPs for security."
    type = string
}