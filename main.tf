resource "aws_ecs_task_definition" "main" {
  family                   = var.name
  task_role_arn            = var.task_role
  execution_role_arn       = var.execution_role_arn
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  requires_compatibilities = var.requires_compatibilities

  container_definitions = var.container_definitions


  dynamic "proxy_configuration" {
    for_each = var.create_proxy_configuration ? [var.proxy_configuration] : []

    content {
      type           = proxy_configuration.value["type"]
      container_name = proxy_configuration.value["container_name"]
      properties     = proxy_configuration.value["properties"]
    }
  }

  tags = var.tags
}
