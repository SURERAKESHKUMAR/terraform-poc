variable "secrets" {
  type = map(map(map(string)))
}

variable "filename" {
  description = "Secret filename (last path segment)"
  type        = string
}
