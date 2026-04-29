# Using Terraform fof AWS version 6
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# AWS region
provider "aws" {
  region = "ap-southeast-1"
}
