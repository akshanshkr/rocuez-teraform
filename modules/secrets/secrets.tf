# resource "aws_secretsmanager_secret" "secrets" {
#   count      = length(var.secret_names)
#   name       = var.secret_names[count.index]
#   description = "Secret for pod ${var.secret_names[count.index]}"
# }

# resource "aws_secretsmanager_secret_version" "secrets_version" {
#   count      = length(var.secret_names)
#   secret_id  = aws_secretsmanager_secret.secrets[count.index].id
#   secret_string = var.secret_values[count.index]
# }



resource "aws_secretsmanager_secret" "secrets" {
  count       = length(var.secret_names)
  name        = var.secret_names[count.index]
  description = "Secret for ${var.secret_names[count.index]}"
}

resource "aws_secretsmanager_secret_version" "secrets_version" {
  count         = length(var.secret_names)
  secret_id     = aws_secretsmanager_secret.secrets[count.index].id
  secret_string = jsonencode(var.secret_values[count.index])
}

