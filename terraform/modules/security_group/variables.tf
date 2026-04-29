variable "env" {
  type        = string
}

# network module
variable "vpc_id" {
  type        = string
  description = "VPC ID dari module network"
}

# App port
variable "app_port" {
  type        = number
  description = "Port aplikasi Flask"
  default     = 5000
}
