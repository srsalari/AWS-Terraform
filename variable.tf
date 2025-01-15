variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "ami" {
  type    = string
  default = "ami-04479848f66ed1eb4"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_security_group_id" {
  type    = string
  default = "sg-088a38b5caf54ea8d"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0c03ab023bf0a7ccf"
}

variable "bucket_name" {
  type    = string
  default = "saeedmetrocollege14jan2024"
}
