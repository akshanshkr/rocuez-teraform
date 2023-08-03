resource "aws_sqs_queue" "teracar_sqs" {
  name                       = "teracar-sqs-${terraform.workspace}"
  visibility_timeout_seconds = 300
}