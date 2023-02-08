data "aws_region" "current" {}

resource "aws_vpc" "main_vpc" {
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  ipv4_ipam_pool_id    = aws_vpc_ipam_pool.ipv4.id
  ipv4_netmask_length  = var.ipv4_netmask_length
  ipv6_ipam_pool_id    = aws_vpc_ipam_pool.ipv6_public.id
  ipv6_netmask_length  = var.ipv6_netmask_length
  depends_on = [
    aws_vpc_ipam_pool_cidr.ipv4,
    aws_vpc_ipam_pool_cidr.ipv6_public
  ]
  tags = {
    Name = "Web-App-Db-${var.vpc_tags}"
  }
}

resource "aws_vpc_ipam" "main" {
  operating_regions {
    region_name = data.aws_region.current.name
  }
  tags = {
    Name = "vpc_ipam_main"
    }
}

resource "aws_vpc_ipam_pool" "ipv4" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.main.private_default_scope_id
  locale         = data.aws_region.current.name
  tags = {
    "Name" = "ipv4_ipam"
  }
}

resource "aws_vpc_ipam_pool_cidr" "ipv4" {
  ipam_pool_id = aws_vpc_ipam_pool.ipv4.id
  cidr         = var.cidr

}

resource "aws_vpc_ipam_pool" "ipv6_public" {
  address_family                    = "ipv6"
  ipam_scope_id                     = aws_vpc_ipam.main.public_default_scope_id
  allocation_default_netmask_length = var.ipv6_netmask_length
  locale                            = data.aws_region.current.name
}

resource "aws_vpc_ipam_pool_cidr" "ipv6_public" {
  ipam_pool_id = aws_vpc_ipam_pool.ipv6_public.id
}