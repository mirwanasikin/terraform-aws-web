# Network Modules
module "network" {
  source          = "../../modules/network"
  env             = var.env
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

# Role Modules
module "role" {
  source              = "../../modules/role"
  env                 = var.env
  ansible_bucket_name = var.ansible_bucket_name
  iam_role_name       = var.iam_role_name
}

# Security Groups
module "security_group" {
  source   = "../../modules/security_group"
  env      = var.env
  vpc_id   = module.network.vpc_id
  app_port = var.app_port
}

# Compute Modules
module "compute" {
  source                = "../../modules/compute"
  env                   = var.env
  public_subnet_ids     = module.network.public_subnet_ids
  instance_profile_name = module.role.instance_profile_name
  ami_id                = var.ami_id
  ec2_sg_id             = module.security_group.ec2_sg_id
  instance_type         = var.instance_type
  instances             = var.instances
}

# Load Balancer Modules
module "load_balancer" {
  source            = "../../modules/load_balancer"
  env               = var.env
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  alb_sg_id         = module.security_group.alb_sg_id
  instance_ids      = module.compute.instance_ids
  app_port          = var.app_port
}

# Database Module
module "database" {
  source             = "../../modules/database"
  env                = var.env
  private_subnet_ids = module.network.private_subnet_ids
  rds_sg_id          = module.security_group.rds_sg_id
  db_instance_class  = var.db_instance_class
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
}

# Cloudfront Module
module "cloudfront" {
  source                  = "../../modules/cloudfront"
  env                     = var.env
  s3_regional_domain_name = module.frontend.bucket_regional_domain_name
  alb_dns_name            = module.load_balancer.alb_dns_name
}

# Frontend Module
module "frontend" {
  source         = "../../modules/frontend"
  env            = var.env
  bucket_suffix  = var.bucket_suffix
  cloudfront_arn = module.cloudfront.cloudfront_arn
}
