output "instance_ids" {
  value       = { for k, v in aws_instance.app : k => v.id }
  description = "Map of instance IDs untuk ALB target group attachment"
}
