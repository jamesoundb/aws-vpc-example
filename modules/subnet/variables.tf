variable "vpc_id" {
  type = string
  default = ""
}

variable "public_subnets" {
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
  type = bool
  default = false
}

variable "cidr_block" {
  description = "cidr block association"
  type = string
  default = ""
  
}