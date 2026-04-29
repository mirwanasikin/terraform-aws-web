variable "instances" {
  type = map(object({
    az = string
  }))
}

variable "env" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "public_subnet_ids" {
  type = map(string)
}

variable "instance_profile_name" {
  type = string
}

variable "ec2_sg_id" {
  type = string
}
