variable "oidc_url" {
  description = "The OIDC provider's URL (e.g., https://accounts.google.com)"
  type        = string
}

variable "client_id_list" {
  description = "A list of client IDs allowed to access the OIDC provider"
  type        = list(string)
}

# variable "thumbprint_list" {
#   description = "A list of thumbprints for the OIDC provider's SSL certificate"
#   type        = list(string)
# }

variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}
