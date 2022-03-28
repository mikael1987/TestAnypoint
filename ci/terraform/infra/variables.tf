variable "aws_region" {
  description = "AWS default region"
  type        = string
  default     = "eu-west-1"
}

variable "github_owner" {
  type    = string
  default = "grupomediaset"
}

variable "github_url" {
  type    = string
  default = "https://api.github.com/"
}
