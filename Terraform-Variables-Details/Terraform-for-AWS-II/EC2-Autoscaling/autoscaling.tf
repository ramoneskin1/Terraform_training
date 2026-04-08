#Autoscaling launch configuration
resource "aws_launch_configuration" "levelup-launchconfig" {
  name_prefix    =  "levelup-launchconfig"
  image_id       =  lookup(var.AMIS, var.AWS_REGION)
  instance_type  = "t3.micro"
  key_name       = aws_key_pair.levelup_key.key_name
}

#Autoscaling Group
resource "aws_autoscaling_group" "levelup-autoscaling" {
  name                      = "levelup-autoscaling"
  vpc_zone_identifier       = ["us-east-2b", "us-east-2a"]
  launch_configuration      = aws_launch_configuration.levelup-launchconfig.name
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 200
  health_check_type         = "EC2"
  force_delete              =  true

tag {
  key                      = "Name"
  value                    = "LevelUp Custom EC2 instance"
  propagate_at_launch      =  true
 }
}



