output "alb_sg_id" {
  value       = aws_security_group.alb.id
  description = "ALB SG ID"
}

output "ec2_sg_id" {
  value       = aws_security_group.ec2.id
  description = "EC2 SG ID"
}

output "rds_sg_id" {
  value       = aws_security_group.rds.id
  description = "RDS SG ID"
}
