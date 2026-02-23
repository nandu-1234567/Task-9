resource "aws_db_subnet_group" "mydb_subnet" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.subnets
}

########################
# RDS Instance
########################
resource "aws_db_instance" "mydb" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15.3"
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username   # must not be empty
  password               = var.db_password   # must not be empty
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.security_group_id]
  module "rds" {
  source   = "./modules/rds"
  project_name = var.project_name
  db_name      = var.db_name
  db_username  = var.db_username
  db_password  = var.db_password
  db_instance_class = var.db_instance_class
  security_group_id = aws_security_group.rds_sg.id

  subnets = data.aws_subnets.default.ids  
}
}
