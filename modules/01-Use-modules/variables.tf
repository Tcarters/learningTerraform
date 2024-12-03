
variable "vpc_name" {
    description       = "Name of the Virtual Private Network"
    type              = string
    default           = "vpc-nonprod-01"
}

variable "vpc_cidr" {
    description       = "CIDR block for the VPC"
    type              = string
    default           = "10.1.0.0/16"
}

variable "vpc_azs" {
    description       = "Availability zones for VPC"
    type              = list(string)
    default           = [ "ap-south-1a", "ap-south-1b", "ap-south-1c" ]
}

variable "vpc_private_subnets" {
  description         = "Private subnets for VPC"
  type                = list(string)
  default             = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "vpc_public_subnets" {
  description         = "Public subnets for VPC"
  type                = list(string)
  default             = ["10.1.101.0/24", "10.1.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description         = "Enable NAT gateway for VPC"
  type                = bool
  default             = true
}

variable "vpc_tags" {
  description         = "Tags to apply to resources created by VPC module"
  type                = map(string)
  default = {
    owner             = "IT"
    environment       = "dev"
  }
}