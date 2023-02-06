data "aws_region" "current" {}

resource "aws_vpc_ipam" "main" {
  operating_regions {
    region_name = data.aws_region.current.name
  }
}

resource "aws_vpc_ipam_pool" "main" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.main.private_default_scope_id
  locale         = data.aws_region.current.name
}

resource "aws_vpc_ipam_pool_cidr" "main" {
  ipam_pool_id = aws_vpc_ipam_pool.main.id
  cidr         = var.cidr
}

resource "aws_vpc" "main_vpc" {
  ipv4_ipam_pool_id   = aws_vpc_ipam_pool.main.id
  ipv4_netmask_length = var.ipv4_netmask_length
#   cidr_block = var.cidr_block
  depends_on = [
    aws_vpc_ipam_pool_cidr.main
  ]
  tags = {
    Name = "Main"
  }
}