# Environment Name
variable "env" {
  type = string
}

# Network Variable
variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

# role Variable
variable "ansible_bucket_name" {
  type = string
}

variable "iam_role_name" {
  type = string
}

# Security Group
variable "app_port" {
  type    = number
  default = 5000
}

# Compute Variable
variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instances" {
  type = map(object({
    az = string
  }))
}

# Database Module
variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

# Frontend Module
variable "bucket_suffix" {
  type = string
}
