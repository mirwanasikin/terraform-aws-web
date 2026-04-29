# Environment
variable "env" {
  type        = string
  description = "Environment name (dev/prod)"
}

# From module network
variable "private_subnet_ids" {
  type        = map(string)
  description = "Private subnet IDs dari module network"
}

# From module security_group
variable "rds_sg_id" {
  type        = string
  description = "RDS security group ID dari module security_group"
}

# RDS config
variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "db_name" {
  type        = string
  description = "Nama database"
}

variable "db_username" {
  type        = string
  description = "Master username RDS"
}
