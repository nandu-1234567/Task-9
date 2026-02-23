variable "project_name" {}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
  default     = "admin"  # permanent default if not supplied
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "SuperSecret123!"  # default password for testing, override in prod
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "strapi_db"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "security_group_id" {
  description = "Security group for RDS"
  type        = string
}
