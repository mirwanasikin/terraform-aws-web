# Environment Name
variable "env" {
  type = string
}

# Role Name for SSM
variable "iam_role_name" {
  type = string
}

# Ansible S3 Bucket
variable "ansible_bucket_name" {
  type = string
}
