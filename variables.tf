variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type = bool
  default = true
}

variable "common_tags" {
  type = map
  default = {}
}

variable "vpc_tags" {
   type = map
   default = {}
   
}
variable "igw_tags" {
  default = {}
}
variable "Project_name" {
   type = string
}
variable "environment" {
   type = string 
}
variable "public_subnet_cidrs" {
   type = list
   # we are creating 2 subnets in two different AZ's. that's the reason we are setting the validation.
    validation {
      condition = length(var.public_subnet_cidrs) == 2
      error_message = "Please provice 2 valid public cidrs"  
    }
}
variable "public_subnet" {
    default = {}
}
variable "private_subnet_cidrs" {
   type = list
   # we are creating 2 subnets in two different AZ's. that's the reason we are setting the validation.
    validation {
      condition = length(var.private_subnet_cidrs) == 2
      error_message = "Please provice 2 valid private cidrs"  
    }
}
variable "private_subnet" {
    default = {}
}
variable "database_subnet_cidrs" {
   type = list
   # we are creating 2 subnets in two different AZ's. that's the reason we are setting the validation.
    validation {
      condition = length(var.database_subnet_cidrs) == 2
      error_message = "Please provide 2 valid private cidrs"  
    }
}
variable "database_subnet" {
    default = {}
}
variable "database_subent_group_tags" {
    default = {}
}
variable "nat_gateway_tags" {
    default = {}
}
variable "public_route_table_tags" {
    default = {}
}
variable "private_route_table_tags" {
    default = {}
}
variable "database_route_table_tags" {
    default = {}
}
variable "elastic_ip_tags" {
    default = {}
}
variable "is_pairing_required" {
  type = bool
  default = false
}
variable "peering_tags" {
  default = {}
}