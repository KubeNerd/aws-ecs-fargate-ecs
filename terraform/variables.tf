variable "aws_region" {
  description = "Specifies the AWS region where the resources will be deployed. Example: ''"
  type = string
}

variable "environment" {
  description = "Deployment environment name, such as 'dev', 'test', 'prod'. This categorizes the Network resources by their usage stage"
  type        = string
  default     = "dev"
}


variable "create_vpc_endpoint" {}

variable "network_cidr_block" {
  type = string
}

variable "departament_name" {
  description = "Name of the department responsable for the VPC, e.g, 'engineering', 'marketing', helps in identify ownership of the resources."
  type = string
  default = "engineering"
}


variable "network" {
  description = <<EOT
  General configuration for the network, including:
    - az_count: Number of availability zones to use.
    - cidr_block: IPv4 CIDR block for the VPC, e.g., '10.1.0.0/16'.
    - enable_dns_support: Whether to enable DNS support (true or false).
    - enable_dns_hostnames: Whether to enable DNS hostnames (true or false).
  EOT

  type = object({
    az_count           = number
    cidr_block         = string
    enable_dns_support = bool
    enable_dns_hostnames = bool
  })


    default = {
    az_count           = 2
    cidr_block         = "10.1.0.0/16"
    enable_dns_support = false
    enable_dns_hostnames = false
    }

    validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.network.cidr_block))
    error_message = "The CIDR block is not in a valid format."
    }

    validation {
      condition = var.network.az_count > 0 && var.az_count <= 3
      error_message = "value"
    }
}


variable "use_nat_gateway" {
  description = "Whether to use NAT Gateway to connect the private subnet(s) to the internet or not. Conflicts with use_nat_instance. Setting both to true is not allowed. Choose one based on the cost and performance needs of your environment"
  type        = bool
  default     = false
}

variable "use_nat_instance" {
  description = "Whether to use NAT Instances to connect the private subnet(s) to the internet or not. Conflicts with use_nat_gateway. Setting both to true is not allowed. Choose one based on the cost and performance needs of your environment"
  type        = bool
  default     = false
}


variable "cidr_block" {
  description = "The CIDR block for the VPC, defining its IP address range. Example: '10.0.0.0/16'."
  type = string  

}


variable "vpc_name" {
  description = "Assign a name to the VPC associated with NAT instances, facilitanting easier identification. Default to terraform VPC."
  type = string
  default = "Terraform-vpc"
}

variable "vpc_id" {
  description = "Unique identifier of the VPC where NAT instances will be created, linking these instances to specific virtual network."
  type = string
}

variable "az_count" {
  description = "Specifies the number of Availability Zones across which the NAT Gateways should be deployed. Valid values range from 1 to 3, inclusive, to balance cost and high availability."
  type        = number

  validation {
    condition     = var.az_count > 0 && var.az_count < 4
    error_message = "az_count must be greater than 0 and lesser than 4"
  }
}


variable "service_name" {
  description = "The name of the service the bastion host is associated with, used for naming and tagging resources in AWS"
  type        = string
  default     = "express-todo-api"
}
