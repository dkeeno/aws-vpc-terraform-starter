# Example: HA NAT — one NAT Gateway per AZ (no SPOF on egress).
#
# Cost note: this triples NAT cost (~$96/mo vs. ~$32/mo for single NAT).
# Only enable for prod or workloads that genuinely cannot tolerate AZ-level
# NAT downtime.

module "vpc" {
  source = "../.."

  region        = "eu-west-1"
  vpc_cidr      = "10.10.0.0/16"
  az_count      = 3
  enable_ha_nat = true

  project     = "my-app"
  environment = "prod"

  extra_tags = {
    CostCenter = "platform"
    Owner      = "sre@example.com"
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnet_ids
}
