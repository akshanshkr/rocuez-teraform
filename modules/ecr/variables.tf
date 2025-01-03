# variable "repository_name" {
#   description = "Name of the ECR repository"
#   type        = string
# }

variable "image_tag_mutability" {
  description = "Tag mutability setting for the ECR repository (MUTABLE or IMMUTABLE)"
  type        = string
  default     = "IMMUTABLE"
}

variable "scan_on_push" {
  description = "Enable image scanning on push"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to associate with the repository"
  type        = map(string)
  default     = {}
}

variable "ecr_repository_name" {
    default = {}
}

