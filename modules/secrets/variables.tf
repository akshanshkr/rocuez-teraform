# variable "secret_names" {
#   description = "List of secret names to create"
#   type        = list(string)
# }

# variable "secret_values" {
#   description = "List of secret values corresponding to the secret names"
#   type        = list(string)
# }


variable "secret_names" {
  description = "List of secret names"
  type        = list(string)
}

variable "secret_values" {
  description = "List of key-value pairs for each secret"
  type        = list(map(string))
}

