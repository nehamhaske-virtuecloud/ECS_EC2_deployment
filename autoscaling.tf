######################
# Web Auto Scaling Group
######################
resource "aws_autoscaling_group" "web_asg" {
  name                 = "${var.project_name}-web-asg"
  desired_capacity     = var.web_desired_capacity
  max_size             = var.web_max_size
  min_size             = var.web_min_size

  vpc_zone_identifier = [for s in aws_subnet.public : s.id]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  target_group_arns         = [aws_lb_target_group.web_tg.arn]
  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "${var.project_name}-web-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

######################
# App Auto Scaling Group
######################
resource "aws_autoscaling_group" "app_asg" {
  name                 = "${var.project_name}-app-asg"
  desired_capacity     = var.app_desired_capacity
  max_size             = var.app_max_size
  min_size             = var.app_min_size

  vpc_zone_identifier = [for s in aws_subnet.private_app : s.id]

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  target_group_arns         = [aws_lb_target_group.app_tg.arn]
  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "${var.project_name}-app-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
