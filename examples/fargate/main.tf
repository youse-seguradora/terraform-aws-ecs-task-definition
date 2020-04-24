module "fargate_task" {
  source = "../../"

  name                     = var.name
  container_definitions    = file("task-definitions/task.json")
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
}

variable "name" {}


provider "aws" {
  region = "us-east-2"
}

output "this_name" {
  value = module.fargate_task.name
}

output "this_revision" {
  value = module.fargate_task.name
}

output "this_arn" {
  value = module.fargate_task.name
}
