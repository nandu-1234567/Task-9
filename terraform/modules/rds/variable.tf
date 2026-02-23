variable "project_name" {}
variable "db_username" {
  type        = string
  description = "Master username for the RDS instance"
}

variable "db_password" {
  type        = string
  description = "Master password for the RDS instance"
  sensitive   = true
}

variable "db_name" {
  type        = string
  description = "Database name"
}
variable "db_instance_class" {}
variable "subnets" {
  type = list(string)
}
variable "security_group_id" {}
