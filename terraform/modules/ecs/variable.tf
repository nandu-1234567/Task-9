variable "project_name" {}
variable "subnets" {
  type = list(string)
}
variable "security_group_id" {}
variable "target_group_arn" {}
variable "ecr_url" {}
variable "db_host" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
variable "execution_role_arn" {}
variable "task_role_arn" {}
variable "app_keys" {}
variable "api_token_salt" {}
variable "admin_jwt_secret" {}
variable "jwt_secret" {}