output "name" {
  description = "The name of task definition"
  value       = aws_ecs_task_definition.main.family
}

output "arn" {
  description = "The created task definition ARN"
  value       = aws_ecs_task_definition.main.arn
}

output "revision" {
  description = "The created task definition ARN"
  value       = aws_ecs_task_definition.main.revision
}
