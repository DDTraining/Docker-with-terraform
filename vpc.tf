resource "aws_vpc" "ecs_cluster" {
  cidr_block = var.vpc_cidr

  tags = {
    name = "ecs cluster"
  }
}
