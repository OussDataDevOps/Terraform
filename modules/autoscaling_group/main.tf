resource "aws_launch_configuration" "main" {
  name_prefix   = "lc-"
  image_id      = var.image_id
  instance_type = var.instance_type
  security_groups = [var.security_group_id]
  iam_instance_profile = var.iam_instance_profile_name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "main" {
  launch_configuration = aws_launch_configuration.main.id
  vpc_zone_identifier  = var.subnet_ids
  min_size             = var.min_size
  max_size             = var.max_size
  target_group_arns    = [var.lb_target_group_arn]

  tag {
    key                 = "Name"
    # value               = "ASG-Instance"
    value = "${var.tag_asg}-ASG-Instance-${count.index}"
    propagate_at_launch = true
  }
}
