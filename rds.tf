resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = [for subnet in aws_subnet.private_db : subnet.id]
  tags       = { Name = "${var.project_name}-db-subnet-group" }
}

resource "aws_db_instance" "db" {
  identifier             = "${var.project_name}-db"
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name               = var.db_name   
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = false
  multi_az               = false
  deletion_protection    = false
}
