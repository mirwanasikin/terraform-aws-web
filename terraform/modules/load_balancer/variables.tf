# Environment
variable "env" {
  type = string
}

# from module network
variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = map(string)
}

# from module security_group
variable "alb_sg_id" {
  type = string
}

# from module compute
variable "instance_ids" {
  type = map(string)
}

# App config
variable "app_port" {
  type    = number
  default = 5000
}
