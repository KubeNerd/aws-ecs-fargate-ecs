output "nat_gateway_id" {
  description = "ID of the created NAT Gateway"
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_public_ip" {
  description = "Public IP of the created NAT Gateway"
  value       = aws_nat_gateway.this.public_ip
}

output "nat_gateway_allocation_id" {
  description = "Elastic IP allocation ID associated with the NAT Gateway"
  value       = aws_nat_gateway.this.allocation_id
}

output "nat_gateway_subnet_id" {
  description = "Subnet ID where the NAT Gateway is deployed"
  value       = aws_nat_gateway.this.subnet_id
}
