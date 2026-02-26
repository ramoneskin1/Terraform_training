resource "aws_instance" "MyterraformInstance" {
	count 			= 3
	ami 			= "ami-05803413c51f242b7"
	instance_type   = "t3.micro"

	tags = {
		Name = "demoinstances-${count.index}"
	}
}
