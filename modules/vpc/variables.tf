variable "cidr_block" {
  description = "VPC cidr"
  type = string
  default     = ""
}

variable "cidr" {
  description = "IPAM cidr value"
  type = string
  default = ""
}

variable "ipv4_netmask_length" {
    description = "ipv4_netmask_length for VPC"
    type = number
    default = 1
}

variable "enable_dns_support" {
  description = "Enable/Disable DNS support in the VPC."
  type = bool
  default = true
}

variable "enable_dns_hostnames" {
  description = "Enable/Disable DNS hostnames in the VPC."
  type = bool
  default = true
}

variable "vpc_tags" {
  description = "Tags for VPC"
  type = string
  default = "3-tier"
}