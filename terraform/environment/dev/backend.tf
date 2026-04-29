# Backend to store terraform.tfstate
terraform {
  backend "s3" {
    bucket         = "terra-irwan-s3"
    key            = "dev/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
