# Pulls the docker image
resource "docker_image" "centos_image" {
  name = "centos:latest"
}

#
resource "aws_ecs_cluster" "cluster" {
  name = "cluster"
}


#
resource "aws_ecs_cluster_capacity_providers" "cluster" {
  cluster_name       = aws_ecs_cluster.cluster.name
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}


#ECS SErvice details
resource "aws_ecs_service" "cluster_service" {
  name            = "cluster_service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.cluster_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = [aws_subnet.private_cidr.id]
  }
}



#Task definitions
resource "aws_ecs_task_definition" "cluster_task" {
  family                   = "cluster_task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE", "EC2"]
  cpu                      = 256
  memory                   = 512
  container_definitions    = DEFINITION
  [
    {
      "name"                : "cluster_task",
      "image"               : "centos:latest",
      "cpu"                 : 256,
      "memory"              : 512,
      "essential"           : true,
      "portMappings"  : [
        {
          "containerPort"   : 80
          "hostPort"        : 80
        }
      ]
    }
  ]
  DEFINITION
}
