output "vpc_id" {
  description = "The VPC ID."
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "The VPC CIDR block."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "List of public subnet IDs (one per AZ)."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs (one per AZ)."
  value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  description = "The Internet Gateway ID."
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs."
  value       = aws_nat_gateway.this[*].id
}

output "nat_gateway_public_ips" {
  description = "List of NAT Gateway Elastic IPs (whitelist these on services that need to receive your outbound calls)."
  value       = aws_eip.nat[*].public_ip
}

output "availability_zones" {
  description = "AZs used."
  value       = local.azs
}
