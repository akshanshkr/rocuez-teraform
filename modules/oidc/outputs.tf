output "oidc_arn" {
  description = "The ARN of the OIDC provider"
  value       = aws_iam_openid_connect_provider.oidc_provider.arn
}
