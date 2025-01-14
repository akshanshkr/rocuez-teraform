
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

# variable "ecr_repository_name" {
#     default = {}
# }
variable "ecr_repository_names" {
  description = "List of ECR repository names"
  type        = list(string)
  # default     = [
  #   "prod-api-v18",
  #   "prod-cron-v18",
  #   "prod-socket-v18",
  #   "uat-api-v18",
  #   "python-api-v18"
  # ]
}


