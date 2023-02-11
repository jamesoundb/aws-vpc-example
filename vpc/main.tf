data "aws_region" "current" {}

############################################################ VPC RESOURCES #################################################

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
    Name = "${var.vpc_tags}"
  }
}

resource "aws_vpc_ipam" "main" {
  operating_regions {
    region_name = data.aws_region.current.name
  }
  tags = {
    Name = "${var.vpc_tags}"
  }
}

resource "aws_vpc_ipam_pool" "ipv4" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.main.private_default_scope_id
  locale         = data.aws_region.current.name
  tags = {
    Name = "${var.vpc_tags}"
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
  tags = {
    Name = "${var.vpc_tags}"
  }
}

resource "aws_vpc_ipam_pool_cidr" "ipv6_public" {
  ipam_pool_id = aws_vpc_ipam_pool.ipv6_public.id
}

############################################################ INTERNET GATEWAY RESOURCES #################################################

resource "aws_internet_gateway_attachment" "main" {
  internet_gateway_id = aws_internet_gateway.main.id
  vpc_id              = aws_vpc.main_vpc.id

}

resource "aws_internet_gateway" "main" {
  tags = {
    Name = "${var.vpc_tags}"
  }

}

############################################################ SUBNET RESOURCES #################################################

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
}

# resource "aws_vpc_ipv6_cidr_block_association" "secondary_cidr" {
#   ipv6_netmask_length = 56

# }


resource "aws_subnet" "reserved" {
  vpc_id                          = aws_vpc_ipv4_cidr_block_association.secondary_cidr.id
  count                           = length(var.reserved_subnets)
  cidr_block                      = var.reserved_subnets[count.index]
  availability_zone               = var.azs[count.index]
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  tags = {
    Name = "${var.reserved_subnet_names[count.index]}"
  }
}

resource "aws_subnet" "private_subnets_db" {
  vpc_id                  = aws_vpc_ipv4_cidr_block_association.secondary_cidr.id
  count                   = length(var.private_subnets_db)
  cidr_block              = var.private_subnets_db[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.private_subnet_names_db[count.index]}"
  }

}

resource "aws_subnet" "private_subnets_app" {
  vpc_id                  = aws_vpc_ipv4_cidr_block_association.secondary_cidr.id
  count                   = length(var.private_subnets_app)
  cidr_block              = var.private_subnets_app[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.private_subnet_names_app[count.index]}"
  }
}

resource "aws_subnet" "public_subnets_web" {
  vpc_id                  = aws_vpc_ipv4_cidr_block_association.secondary_cidr.id
  count                   = length(var.public_subnets_web)
  cidr_block              = var.public_subnets_web[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.public_subnet_names[count.index]}"
  }
}

############################################################ ROUTE TABLES RESOURCES #################################################

resource "aws_route_table" "public_subnets_web" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.public_route_web}"
  }
}

resource "aws_route" "default_public_route" {
  route_table_id         = aws_route_table.public_subnets_web.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
  depends_on = [
    aws_route_table.public_subnets_web
  ]
}