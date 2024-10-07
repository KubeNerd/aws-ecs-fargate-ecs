resource "aws_vpc" "this" {

  cidr_block = var.network_cidr_block # https://cidr.xyz
 
  enable_dns_support = local.enable_dns_support
 
  enable_dns_hostnames = local.enable_dns_hostnames

  tags = merge(
    local.common_tags,
    {
        "Name" = local.namespaced_dapartment_name
    }

  )
  
}


resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id


    tags = merge(
    local.common_tags,
    {
        "Name" = local.namespaced_dapartment_name
    }

  )
  
}