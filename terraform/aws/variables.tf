# AWS settings

# variable to identify environment
variable "env" {
  type    = "string"
  default = "bitcoin"
}

# VPC/subnet first two octet CIDR to use
variable "cidr" {
 type    = "string"
 default = "10.253"
}

# SSH key pair to use.  This needs to be in AWS.
variable "keypair" {
  type    = "string"
  default = "bitcoin"
}
 
# Instance type to use 
variable "type" {
  type    = "string"
  default = "t2.micro"
}

# AWS region
variable "region" {
  type    = "string"
  default = "ca-central-1"
}

# AWS access_key
variable "aws_access_key" {
  type    = "string"
  default = ""
}

# AWS secret_key
variable "aws_secret_key" {
  type    = "string"
  default = ""
}

# if you need to define tenancy
variable "tenancy" {
  type    = "string"
  default = "default"
}

