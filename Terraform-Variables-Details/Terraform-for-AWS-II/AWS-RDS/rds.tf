#RDS Resources
resource "aws_db_subnet_group" "mariadb-subnets" {
  name        = "mariadb-subnet"
  description = "Amazon RDS subnet group"
  subnet_ids  =  [aws_subnet.levelupvpc-private-1.id, aws_subnet.levelupvpc-private-2.id]
  }

#RDS Parameters
resource "aws_db_parameter_group" "levelup-mariadb-parameters" {
  name        =  "levelup-mariadb-parameters"
  family      =  "mariadb10.11"
  description = "MariaDB parameter group"

  parameter {
    name   = "max_allowed_packet"
    value  = "16777216"
  }
}

#RDS Instance properties
resource "aws_db_instance" "levelup-mariadb" {
  allocated_storage        =  20  # 20gb of storage
  engine                   =  "mariadb"
  engine_version           =   "10.11.16"
  instance_class           =   "db.t3.micro" 
  identifier               =   "mariadb"
  name                     =  "mariadb"
  username                 =   "root"
  password                 =  "mariadb123"
  db_subnet_group_name     =  aws_db_subnet_group.mariadb-subnets.name
  parameter_group_name     = aws_db_parameter_group.levelup-mariadb-parameters.name
  multi_az                 = "false"
  vpc_security_group_ids   = [aws_security_group.allow-mariadb.id]
  storage_type             = "gp2"
  backup_retention_period  = 30
  availability_zone        =  aws_subnet.levelupvpc-private-1.availability_zone
  skip_final_snapshot      = true
  tags = {
  name = "levelup-mariadb"
 }
}




