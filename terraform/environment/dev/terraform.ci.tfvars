env = "dev"
vpc_cidr = "10.0.0.0/16"
public_subnets = {
  "a" = { cidr = "10.0.1.0/24", az = "ap-southeast-1a" }
  "b" = { cidr = "10.0.2.0/24", az = "ap-southeast-1b" }
}
private_subnets = {
  "a" = { cidr = "10.0.11.0/24", az = "ap-southeast-1a" }
  "b" = { cidr = "10.0.12.0/24", az = "ap-southeast-1b" }
}
instances = {
  "a" = { az = "ap-southeast-1a" }
  "b" = { az = "ap-southeast-1b" }
}
ami_id            = "ami-04adcc471b49efd50"
instance_type     = "t3.micro"
iam_role_name     = "SSM-IRWAN"
bucket_suffix     = "irwan-dev"
db_instance_class = "db.t3.micro"
ansible_bucket_name = "irwan-ansible-bucket"
