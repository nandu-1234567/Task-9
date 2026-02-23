variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "strapi"
}

variable "db_name" {
  type    = string
  default = "strapi"
}

variable "db_username" {
  type    = string
  default = "strapiuser"
}

variable "db_password" {
  type      = string
  sensitive = true
  default   = "StrongPassword123"
}

variable "aws_db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "execution_role_arn" {}
variable "task_role_arn" {}

variable "app_keys" {}
variable "api_token_salt" {}
variable "admin_jwt_secret" {}
variable "jwt_secret" {}
variable "ecr_url" {
  description = "The full URI of the Docker image in ECR (with tag)"
  type        = string
}
