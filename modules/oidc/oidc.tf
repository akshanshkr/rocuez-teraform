resource "aws_iam_openid_connect_provider" "oidc_provider" {
  url                   = var.oidc_url
  client_id_list        = var.client_id_list
  # thumbprint_list       = var.thumbprint_list

  tags = {
    Name        = "OIDC-Connector-${var.env}"
    Environment = var.env
  }
}
