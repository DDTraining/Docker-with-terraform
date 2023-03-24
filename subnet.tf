resource "aws_subnet" "private_cidr" {
  vpc_id            = aws_vpc.ecs_cluster.id
  cidr_block        = var.private_cidr
  availability_zone = var.region_1a


  tags = {
    Name = "ecs cluster"
  }
}
