variable "aws_region" {
  description = "Specifies the AWS region where the resources will be deployed. Example: ''"
  type = string
}

variable "environment" {
  description = "Deployment environment name, such as 'dev', 'test', 'prod'. This categorizes the Network resources by their usage stage"
  type        = string
  default     = "dev"
}

variable "vpc_name" {
  description = "Assigns a name to the VPC associated with NAT instances, facilitating easier identification. Defaults to 'terraform-vpc'."
  type        = string
  default     = "terraform-vpc"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC, defining its IP address range. Example format: '10.0.0.0/16'."
  type        = string
}

variable "private_route_table_ids" {
  description = "List of IDs for the private route tables within the VPC, used for routing decisions within private subnets."
  type        = list(string)
}
variable "private_subnet_ids" {
  description = "List of IDs for the private route tables within the VPC, used for routing decisions within private subnets."
  type        = list(string)
}


variable "vpc_id" {
  description = "Unique identifier of the VPC where NAT instances will be created, linking these instances to a specific virtual network."
  type        = string
}