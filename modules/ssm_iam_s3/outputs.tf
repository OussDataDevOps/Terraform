output "role_name" {
  value = aws_iam_role.ssm_s3_role.name
}

output "role_arn" {
  value = aws_iam_role.ssm_s3_role.arn
}