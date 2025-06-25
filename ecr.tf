resource "aws_ecr_repository" "app" {
  name = "ecs-ec2-app-repo"
}

resource "aws_ecr_repository" "web" {
  name = "ecs-ec2-web-repo"
}
