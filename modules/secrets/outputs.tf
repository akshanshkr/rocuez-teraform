output "secrets_arns" {
  description = "ARNs of the created secrets"
  value       = aws_secretsmanager_secret.secrets[*].arn
}