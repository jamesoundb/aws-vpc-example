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