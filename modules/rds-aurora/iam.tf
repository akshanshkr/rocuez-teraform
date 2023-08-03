resource "aws_iam_role" "rds_enhanced_monitoring_role" {
  name_prefix        = "rds-enhanced-monitoring-${terraform.workspace}"
  assume_role_policy = data.aws_iam_policy_document.rds_enhanced_monitoring_policy.json
}

resource "aws_iam_role_policy_attachment" "rds_enhanced_policy_attach" {
  role       = aws_iam_role.rds_enhanced_monitoring_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

data "aws_iam_policy_document" "rds_enhanced_monitoring_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}