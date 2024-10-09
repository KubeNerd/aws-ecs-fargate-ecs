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

variable "service_name" {
  description = "The name of the service the bastion host is associated with, used for naming and tagging resources in AWS"
  type        = string
  default     = "express-todo-api"
}


variable "db_engine" {
  description = "Specifies the database engine and version for the RDS instance. 'engine' determines the database software (e.g., 'aurora-postgresql' for Amazon Aurora with PostgreSQL compatibility), and 'version' specifies the engine version (e.g., '15' for PostgreSQL 15). Ensure the version is supported in your AWS region."
  
  type = object({
    engine  = string
    version = string
  })

  default = {
    engine  = "aurora-postgresql"
    version = "16"
  }
}

variable "db_user" {
  description = "Username for the database administrator. This user will have permissions to create, read, update, and delete data in the database."
  type        = string
}

variable "az_count" {
  description = "Specifies the number of Availability Zones across which the NAT Gateways should be deployed. Valid values range from 1 to 3, inclusive, to balance cost and high availability."
  type        = number

  validation {
    condition     = var.az_count > 0 && var.az_count < 4
    error_message = "az_count must be greater than 0 and lesser than 4"
  }
}


variable "db_name" {
  type = string
  default = ""
}