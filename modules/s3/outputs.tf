output "bucket_name" {
  value = aws_s3_bucket.s3-bucket-1.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.s3-bucket-1.arn
}