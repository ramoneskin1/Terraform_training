resource "aws_instance" "MyterraformInstance" {
	ami 			= "ami-05803413c51f242b7"
	instance_type   = "t3.micro"
}
