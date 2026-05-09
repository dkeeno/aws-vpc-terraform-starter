variable "region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of availability zones to use (max 3)."
  type        = number
  default     = 3

  validation {
    condition     = var.az_count >= 2 && var.az_count <= 3
    error_message = "az_count must be 2 or 3."
  }
}

variable "enable_ha_nat" {
  description = "If true, deploy one NAT Gateway per AZ. If false, deploy a single shared NAT in the first public subnet."
  type        = bool
  default     = false
}

variable "project" {
  description = "Project name — used as a tag and in resource names."
  type        = string
  default     = "vpc-starter"
}

variable "environment" {
  description = "Environment (dev / staging / prod)."
  type        = string
  default     = "dev"
}

variable "extra_tags" {
  description = "Additional tags merged into every resource."
  type        = map(string)
  default     = {}
}
