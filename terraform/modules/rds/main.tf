resource "aws_db_subnet_group" "this" {
  name       = "strapi-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "strapi-db-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier             = "strapi-db"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.this.name
}
