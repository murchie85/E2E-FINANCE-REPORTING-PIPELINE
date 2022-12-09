# Configure AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket for storing processed log data
resource "aws_s3_bucket" "log_data_bucket" {
  bucket = "log-data-bucket"
  acl    = "private"
}

# Create a Kinesis stream for ingesting log data
resource "aws_kinesis_stream" "log_data_stream" {
  name        = "log-data-stream"
  shard_count = 1
}

# Create an SQS queue for triggering the processing Lambda function
resource "aws_sqs_queue" "log_data_queue" {
  name = "log-data-queue"
}

# Create a Lambda function for processing log data
resource "aws_lambda_function" "process_log_data" {
  function_name = "process-log-data"
  role          = "arn:aws:iam::xxxxxx:role/lambda-execution-role"
  handler       = "index.handler"
  runtime       = "python3.7"
  source_code_hash = filebase64sha256("process_log_data.zip")
  
  # Set up the Lambda function to be triggered by the SQS queue
  event_source_mappings {
    event_source_arn = aws_sqs_queue.log_data_queue.arn
    batch_size       = 1
  }
}

# Create an SNS topic for sending notifications
resource "aws_sns_topic" "log_data_notifications" {
  name = "log-data-notifications"
}

# Subscribe the Lambda function to the SNS topic
resource "aws_sns_topic_subscription" "process_log_data" {
  topic_arn = aws_sns_topic.log_data_notifications.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.process_log_data.arn
}
