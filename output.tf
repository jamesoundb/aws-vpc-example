output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "VPC cidr"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_default_network_acl_id" {
  value = module.vpc.vpc_default_network_acl_id
}

output "vpc_default_route_table_id" {
  value = module.vpc.vpc_default_route_table_id
}

output "vpc_default_security_group_id" {
  value = module.vpc.vpc_default_security_group_id
}

output "vpc_dhcp_options_id" {
  value = module.vpc.vpc_dhcp_options_id
}

output "vpc_enable_dns_hostnames" {
  value = module.vpc.vpc_enable_dns_hostnames
}

output "vpc_enable_dns_support" {
  value = module.vpc.vpc_enable_dns_support
}

output "vpc_instance_tenancy" {
  value = module.vpc.vpc_instance_tenancy
}

output "vpc_ipv6_association_id" {
  value = module.vpc.vpc_ipv6_association_id
}

output "vpc_ipv6_cidr_block" {
  value = module.vpc.vpc_ipv6_cidr_block
}

output "vpc_main_route_table_id" {
  value = module.vpc.vpc_main_route_table_id
}

output "vpc_tags" {
  value = module.vpc.vpc_tags
}