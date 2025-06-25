resource "aws_launch_template" "web_lt" {
  name_prefix   = "${var.project_name}-web-lt"
  image_id      = data.aws_ami.ecs_ami.id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = base64encode(file("ecs-userdata.sh"))

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_instance_profile.name
  }

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-web"
    }
  }
}

resource "aws_launch_template" "app_lt" {
  name_prefix   = "${var.project_name}-app-lt"
  image_id      = data.aws_ami.ecs_ami.id
  instance_type = var.instance_type
  user_data     = base64encode(file("ecs-userdata.sh"))

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_instance_profile.name
  }

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-app"
    }
  }
}
