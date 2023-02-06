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