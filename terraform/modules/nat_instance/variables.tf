variable "vpc_name" {
  description = "Assigns a name to the VPC associated with NAT instances, facilitating easier identification. Defaults to 'terraform-vpc'."
  type        = string
  default     = "terraform-vpc"
}

variable "az_count" {
  description = "Specifies the number of Availability Zones across which the NAT Gateways should be deployed. Valid values range from 1 to 3, inclusive, to balance cost and high availability."
  type        = number

  validation {
    condition     = var.az_count > 0 && var.az_count < 4
    error_message = "az_count must be greater than 0 and lesser than 4"
  }
}


variable "public_subnet_ids" {
  description = "List of IDs for the private route tables within the VPC, used for routing decisions within private subnets."
  type        = list(string)
}
