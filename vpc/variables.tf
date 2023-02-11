variable "vpc_id" {
  type    = string
  default = ""
}

variable "public_subnets_web" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets_db" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets_app" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "reserved_subnets" {
  description = "A list of reserved subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "public_subnet_names" {
  description = "A list of public subnet names inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnet_names_db" {
  description = "A list of private subnet names inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnet_names_app" {
  description = "A list of private subnet names inside the VPC"
  type        = list(string)
  default     = []
}

variable "reserved_subnet_names" {
  description = "A list of public subnet names inside the VPC"
  type        = list(string)
  default     = []
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "assign_ipv6_address_on_creation" {
  description = "Enable ipv6 upon creation"
  type        = bool
  default     = false
}

variable "cidr_block" {
  description = "cidr block association"
  type        = string
  default     = ""

}

variable "cidr" {
  description = "IPAM cidr value"
  type        = string
  default     = ""
}

variable "ipv4_netmask_length" {
  description = "ipv4 netmask length for VPC"
  type        = number
  default     = 20
}

variable "ipv6_netmask_length" {
  description = "ipv6 netmask length for VPC"
  type        = number
  default     = 56
}

variable "enable_dns_support" {
  description = "Enable/Disable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable/Disable DNS hostnames in the VPC."
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags for VPC"
  type        = string
  default     = "3-tier"
}

variable "public_route_web" {
  description = "Public route tags"
  type        = string
  default     = "public_route_web"
}

variable "private_route_db" {
  description = "Private route tags for db"
  type        = string
  default     = "private_route_db"
}

variable "private_route_app" {
  description = "Private route tags for app"
  type        = string
  default     = "private_route_app"
}