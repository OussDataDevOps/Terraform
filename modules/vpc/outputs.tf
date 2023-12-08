output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "ssm_endpoint_id" {
  value = aws_vpc_endpoint.ssm.id
}

output "ssm_messages_endpoint_id" {
  value = aws_vpc_endpoint.ssm_messages.id
}

output "ec2_messages_endpoint_id" {
  value = aws_vpc_endpoint.ec2_messages.id
}

# endpoint pour S3
output "s3_endpoint_id" {
  value = aws_vpc_endpoint.s3.id
}
