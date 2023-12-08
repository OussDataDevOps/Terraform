resource "aws_lb" "main" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids

  security_groups = [var.security_group_id]

  tags = {
    Name = var.name
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.id
  }
}

resource "aws_lb_target_group" "main" {
  name     = var.name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}