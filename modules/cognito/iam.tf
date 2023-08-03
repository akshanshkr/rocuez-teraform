resource "aws_iam_role" "cognito_sns_caller_role" {
  name = "terajob-cognito-role-${terraform.workspace}"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "cognito-idp.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": "",
     "Condition": {
        "StringEquals": {
            "sts:ExternalId": "${var.sms_config_external_id}"
        }
     }
   }
 ]
}
EOF
}

resource "aws_iam_role_policy" "cognito_sns_caller_role_policy" {
  name = "sns_publish_access_${terraform.workspace}"
  role = aws_iam_role.cognito_sns_caller_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "SNS:Publish",
        ]
        Effect   = "Allow"
        Resource = ["*"]
      }
    ]
  })
}
