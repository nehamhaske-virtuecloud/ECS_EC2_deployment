# Web Capacity Provider
resource "aws_ecs_capacity_provider" "web_cp" {
  name = "${var.project_name}-web-cp-custom"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.web_asg.arn

    managed_scaling {
      status                    = "ENABLED"
      target_capacity           = 80
      minimum_scaling_step_size = 1
      maximum_scaling_step_size = 100
    }

    managed_termination_protection = "ENABLED"
  }

  tags = {
    Name = "${var.project_name}-web-cp"
  }
}

# App Capacity Provider
resource "aws_ecs_capacity_provider" "app_cp" {
  name = "${var.project_name}-app-cp-custom"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.app_asg.arn

    managed_scaling {
      status                    = "ENABLED"
      target_capacity           = 80
      minimum_scaling_step_size = 1
      maximum_scaling_step_size = 100
    }

    managed_termination_protection = "ENABLED"
  }

  tags = {
    Name = "${var.project_name}-app-cp"
  }
}


resource "aws_ecs_cluster_capacity_providers" "attach_cp" {
  cluster_name = aws_ecs_cluster.ecs_cluster.name

  capacity_providers = [
    aws_ecs_capacity_provider.web_cp.name,
    aws_ecs_capacity_provider.app_cp.name
  ]
}
