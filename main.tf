locals {
  region = "us-east-1"
}

module "vpc" {
  source              = "./modules/vpc"
  cidr                = "10.16.0.0/16"
  ipv4_netmask_length = 20
}

module "subnet" {
  cidr_block                      = "10.16.0.0/20"
  vpc_id                          = module.vpc.vpc_id
  source                          = "./modules/subnet"
  reserved_subnets                = ["10.16.0.0/20", "10.16.64.0/20", "10.16.128.0/20"]
  private_subnets_db              = ["10.16.16.0/20", "10.16.80.0/20", "10.16.144.0/20"]
  private_subnets_app             = ["10.16.32.0/20", "10.16.96.0/20", "10.16.160.0/20"]
  public_subnets                  = ["10.16.48.0/20", "10.16.112.0/20", "10.16.176.0/20"]
  assign_ipv6_address_on_creation = true

  reserved_subnet_names    = ["Reserved_Tier_A", "Reserved_Tier_B", "Reserved_Tier_C"]
  private_subnet_names_db  = ["Db_A", "Db_B", "Db_C"]
  private_subnet_names_app = ["App_A", "App_B", "App_C"]
  public_subnet_names      = ["Web_A", "Web_B", "Web_C"]


  azs = ["${local.region}a", "${local.region}b", "${local.region}c"]
}

    