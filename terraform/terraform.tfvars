aws_region = "us-east-1"

# Project / ECS
project_name = "strapi"

# Database credentials
db_name     = "strapi"
db_username = "strapiuser"
db_password = "StrongPassword123"

# RDS instance class
aws_db_instance_class = "db.t3.micro"

# IAM Roles for ECS Task
execution_role_arn = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"
task_role_arn      = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"

# Strapi secrets
app_keys         = "randomkey123456"
api_token_salt   = "salt123456"
admin_jwt_secret = "adminsecret123456"
jwt_secret       = "jwtsecret123456"
