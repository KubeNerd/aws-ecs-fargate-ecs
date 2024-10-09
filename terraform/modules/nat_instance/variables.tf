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

variable "vpc_id" {
  description = "The ID of the VPC where the NAT instance will be created."
  type        = string
}

variable "nat_instance_count" {
  description = "The number of NAT instances to be created."
  type        = number
  default     = 1
}

variable "nat_instance_type" {
  description = "The EC2 instance type for the NAT instance."
  type        = string
  default     = "t3.micro"
}

variable "public_subnet_ids" {
  description = "The list of public subnet IDs where the NAT instances will be launched."
  type        = list(string)
}

variable "az_codes" {
  description = "The availability zone codes for the NAT instances."
  type        = list(string)
  default     = ["a", "b", "c", "d"]
}
