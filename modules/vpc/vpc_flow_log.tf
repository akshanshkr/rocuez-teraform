# resource "aws_flow_log" "vpc_flow_CW" {
#   iam_role_arn    = aws_iam_role.vpc_flowlogs_role.arn
#   log_destination = aws_cloudwatch_log_group.cw-logs-group.arn
#   traffic_type    = "ALL"
#   vpc_id          = aws_vpc.main.id

#   tags = {
#     Name        = "advskill-${terraform.workspace}-vpc-flow-CW-logs"
#     Environment = terraform.workspace
#     Maintainer  = "Terraform"
#   }
# }

# resource "aws_cloudwatch_log_group" "cw-logs-group" {
#   name = "vpc-flowlog-logs-group-${terraform.workspace}"
# }

# resource "aws_flow_log" "vpc_flow_s3" {
#   log_destination      = var.s3_bucket_arn
#   log_destination_type = "s3"
#   traffic_type         = "ALL"
#   vpc_id               = aws_vpc.main.id

#   tags = {
#     Name        = "advskill-${terraform.workspace}-vpc-flow-logs-s3"
#     Environment = terraform.workspace
#     Maintainer  = "Terraform"
#   }

# }