#IAM Resource block for Lambda IAM role.
resource "aws_iam_role" "iam_lambda_test" {
  name                 = "lambda_test_iam"
  assume_role_policy   = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

#Attachment of a Managed AWS IAM Policy for Lambda basic execution
resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy" {
  policy_arn             = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role                   = aws_iam_role.iam_lambda_test.name
}

#Attachment of a Managed AWS IAM Policy for Lambda sqs execution
resource "aws_iam_role_policy_attachment" "lambda_basic_sqs_queue_execution_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
  role       = aws_iam_role.iam_lambda_test.name
}

resource "aws_iam_role_policy_attachment" "lambda_basic_s3_read_access_policy" {
  role       = aws_iam_role.iam_lambda_test.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

#Lambda Function Resource
resource "aws_lambda_function" "lambda_test" {
  function_name    = var.lambda_name
  role             = aws_iam_role.iam_lambda_test.arn
  description      = var.lambda_description
  handler          = var.handler
  memory_size      = var.lambda_memory_size
  s3_bucket        = var.s3_bucket
  s3_key           = var.s3_key
  runtime          = var.lambda_runtime
  timeout          = var.lambda_timeout 
  # depends_on       = [ aws_iam_role.iam_lambda_test ]
  depends_on = [aws_iam_role.iam_lambda_test, var.s3_object_arn_for_dependency]
}

#Lambda SQS Trigger
resource "aws_lambda_event_source_mapping" "lambda_test_sqs_trigger" {
  event_source_arn = var.event_source_arn
  function_name    = aws_lambda_function.lambda_test.arn
}
