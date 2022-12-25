variable "region" {
  description = "AWS region to deploy resources."
  type = string
}

variable "aws_vpc" {
    description = "Specify existing vpc id"
	type = string
    #Example = vpc-076239dcee15756e8
}

variable "secondary_cidr" {
    description = "secondry cidr"
	type = string
    #Example = 10.0.0.0/25
}

variable "project_name" {
  description = "Project name which will be applied to tags"
  type = string
}

variable "availability_zones" {
  description = "Specify Availability Zones to be used, separated by comma's"
  type = list(string)
}

variable "private_subnets" {
  description = "If you want to create private subnets, then specify subnet CIDR's separated by comma's"
  type = list(string)
}

variable "shared_transit_gateway_id" {
  description = "Shared Transit Gateway ID"
  type = string
}

variable "transit_gateway_vpc_attachment" {
  description = "Shared Transit Gateway attachment ID"
  type = list(string)
}
