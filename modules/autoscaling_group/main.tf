resource "aws_launch_configuration" "main" {
  name_prefix   = "lc-"
  image_id      = var.image_id
  instance_type = var.instance_type
  security_groups = [var.security_group_id]
  iam_instance_profile = var.iam_instance_profile_name

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apt-transport-https ca-certificates curl software-properties-common
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
              echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
              apt-get update -y
              apt-get install -y docker-ce
              systemctl start docker
              systemctl enable docker
              docker pull kaminskypavel/mario
              docker run -d -p 80:8080 kaminskypavel/mario
              EOF

}

resource "aws_autoscaling_group" "main" {
  name                 = var.tag_asg
  launch_configuration = aws_launch_configuration.main.id
  vpc_zone_identifier  = var.subnet_ids
  min_size             = var.min_size
  max_size             = var.max_size
  target_group_arns    = [var.lb_target_group_arn]

  tag {
    key                 = "Name"
    value               = var.tag_asg
    propagate_at_launch = true
  }
}
