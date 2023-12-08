output "ec2_ssm_role_arn" {
  value = aws_iam_role.ec2_ssm_role.arn
}

output "ec2_ssm_role_name" {
  value = aws_iam_role.ec2_ssm_role.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_ssm_instance_profile.name
}