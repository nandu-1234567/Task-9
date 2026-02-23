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
  db_subnet_group_name   = aws_db_subnet_group.mydb_subnet.name
}
