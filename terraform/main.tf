module "rds" {
  source            = "./modules/rds"
  project_name      = var.project_name
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.aws_db_instance_class
  subnet_ids = data.aws_subnets.default.ids
  security_group_id = aws_security_group.ecs_sg.id
}

 module "ecs" {
  source = "./modules/ecs"

  project_name      = var.project_name
  subnets           = data.aws_subnets.default.ids
  security_group_id = aws_security_group.ecs_sg.id
  target_group_arn  = aws_lb_target_group.tg.arn
  ecr_url           = aws_ecr_repository.strapi_repo.repository_url

  db_host     = module.rds.db_endpoint
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
    execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  app_keys         = var.app_keys
  api_token_salt   = var.api_token_salt
  admin_jwt_secret = var.admin_jwt_secret
  jwt_secret       = var.jwt_secret
}
