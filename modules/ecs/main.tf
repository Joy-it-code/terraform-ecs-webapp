resource "aws_ecs_cluster" "ecs_cluster" {
  name = "my-ecs-cluster"
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = var.service_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "my-webapp-service",
      image     = var.ecr_repository_url,
      cpu       = 256,
      memory    = 512,
      essential = true,
      portMappings = [
        {
          containerPort = var.container_port,
          hostPort      = var.container_port
        }
      ]
    }
  ])
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.ecs_cluster.name
}
