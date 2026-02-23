resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-cluster"
}
resource "aws_ecs_task_definition" "strapi" {
  family                   = "${var.project_name}-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024

  execution_role_arn = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"
  task_role_arn      = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"

  container_definitions = jsonencode([
    {
      name      = "strapi"
      image     = "${var.ecr_url}:latest"
      essential = true

      portMappings = [
        {
          containerPort = 1337
          hostPort      = 1337
        }
      ]
      environment = [
  { name = "HOST", value = "0.0.0.0" },
  { name = "PORT", value = "1337" },
  { name = "NODE_ENV", value = "production" },

  { name = "APP_KEYS", value = "randomkey123456" },
  { name = "API_TOKEN_SALT", value = "salt123456" },
  { name = "ADMIN_JWT_SECRET", value = "adminsecret123456" },
  { name = "JWT_SECRET", value = "jwtsecret123456" },

  { name = "DATABASE_CLIENT", value = "postgres" },
  { name = "DATABASE_HOST", value = var.db_host },
  { name = "DATABASE_PORT", value = "5432" },
  { name = "DATABASE_NAME", value = var.db_name },
  { name = "DATABASE_USERNAME", value = var.db_username },
  { name = "DATABASE_PASSWORD", value = var.db_password },
  { name = "DATABASE_SSL", value = "false" }
]
    }
  ])
}