variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}


variable "subnet_cidr" {
  description = "SUBNET CIDR "
  type = string
}


variable "subnet_name" {
  description = "SUBNET name"
  type = string
  default = "jd-publicsubnet1"
}
