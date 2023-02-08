output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main_vpc.cidr_block
}

output "vpc_default_network_acl_id" {
  value = aws_vpc.main_vpc.default_network_acl_id
}

output "vpc_default_route_table_id" {
  value = aws_vpc.main_vpc.default_route_table_id
}

output "vpc_default_security_group_id" {
  value = aws_vpc.main_vpc.default_security_group_id
}

output "vpc_dhcp_options_id" {
  value = aws_vpc.main_vpc.dhcp_options_id
}

output "vpc_enable_dns_hostnames" {
  value = aws_vpc.main_vpc.enable_dns_hostnames
}

output "vpc_enable_dns_support" {
  value = aws_vpc.main_vpc.enable_dns_support
}

output "vpc_instance_tenancy" {
  value = aws_vpc.main_vpc.instance_tenancy
}

output "vpc_ipv6_association_id" {
  value = aws_vpc.main_vpc.ipv6_association_id
}

output "vpc_ipv6_cidr_block" {
  value = aws_vpc.main_vpc.ipv6_cidr_block
}

output "vpc_main_route_table_id" {
  value = aws_vpc.main_vpc.main_route_table_id
}

output "vpc_tags" {
  value = aws_vpc.main_vpc.tags
}

