resource "aws_s3_bucket" "s3-bucket-1" {
  bucket = var.bucket_name
}

#Block Public Access Bucket 1
resource "aws_s3_bucket_public_access_block" "s3-bucket-1-block" {
  bucket = aws_s3_bucket.s3-bucket-1.id
  block_public_acls       = var.s3_bucket_1_block_public_acl
  block_public_policy     = var.s3_bucket_1_block_public_policy
  ignore_public_acls      = var.s3_bucket_1_ignore_public_acls
  restrict_public_buckets = var.s3_bucket_1_restrict_public_buckets
}

# Compresser le fichier lambda.py en lambda.zip
data "archive_file" "lambda_zip" {
  type        = var.type_archive_file
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

# Télécharger le fichier ZIP dans le bucket S3
resource "aws_s3_object" "lambda_zip" {
  bucket = aws_s3_bucket.s3-bucket-1.bucket
  key    = var.key_s3_bucket_object
  source = "${path.module}/lambda_function.zip"
  etag   = filemd5("${path.module}/lambda_function.zip")
}