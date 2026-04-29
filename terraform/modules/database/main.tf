# Subnet group 
resource "aws_db_subnet_group" "main" {
  name       = "${var.env}-db-subnet-group"
  subnet_ids = values(var.private_subnet_ids)

  tags = {
    Name = "${var.env}-db-subnet-group"
  }
}

# RDS Instance
resource "aws_db_instance" "main" {
  identifier        = "${var.env}-db"
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = var.db_instance_class
  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username

  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_sg_id]

  skip_final_snapshot = true

  tags = {
    Name = "${var.env}-db"
  }
}
