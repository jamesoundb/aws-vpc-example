data "aws_region" "current" {}

locals {
  region = data.aws_region.current.id
}

module "vpc" {
  source                          = "./vpc"
  cidr                            = "10.16.0.0/16"
  ipv4_netmask_length             = 20
  ipv6_netmask_length             = 56
  enable_dns_hostnames            = true
  enable_dns_support              = true
  cidr_block                      = "10.16.0.0/20"
  vpc_id                          = module.vpc.vpc_id
  reserved_subnets                = ["10.16.0.0/20", "10.16.64.0/20", "10.16.128.0/20"]
  private_subnets_db              = ["10.16.16.0/20", "10.16.80.0/20", "10.16.144.0/20"]
  private_subnets_app             = ["10.16.32.0/20", "10.16.96.0/20", "10.16.160.0/20"]
  public_subnets_web              = ["10.16.48.0/20", "10.16.112.0/20", "10.16.176.0/20"]
  assign_ipv6_address_on_creation = true

  reserved_subnet_names    = ["Reserved_Tier_AZ_A", "Reserved_Tier_AZ_B", "Reserved_Tier_AZ_C"]
  private_subnet_names_db  = ["Db_AZ_A", "Db_AZ_B", "Db_AZ_C"]
  private_subnet_names_app = ["App_AZ_A", "App_AZ_B", "App_AZ_C"]
  public_subnet_names      = ["Web_AZ_A", "Web_AZ_B", "Web_AZ_C"]


  azs = ["${data.aws_region.current.id}a", "${data.aws_region.current.id}b", "${data.aws_region.current.id}c"]
}
