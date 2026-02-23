variable "project_name" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
variable "db_instance_class" {}
variable "subnets" {
  type = list(string)
}
variable "security_group_id" {}
