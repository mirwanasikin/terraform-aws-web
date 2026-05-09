output "db_endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "RDS endpoint untuk koneksi dari EC2"
}

