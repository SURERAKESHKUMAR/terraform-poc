variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "secrets" {
  description = "Repo -> Env -> Secrets"
  type        = map(map(map(string)))
}
