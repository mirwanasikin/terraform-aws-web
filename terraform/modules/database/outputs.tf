output "db_endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "RDS endpoint untuk koneksi dari EC2"
}

output "db_secret_arn" {
  value       = aws_db_instance.main.master_user_secret[0].secret_arn
  description = "ARN secret di Secrets Manager"
}
