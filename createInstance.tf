provider "aws"{
	access_key = "AKIAUT2C35BWJVFCOXH5"
	secret_key = "secret0key-here"
	region     = "us-east-2"
}

resource "aws_instance" "MyterraformInstance" {
	ami 			= "ami-05803413c51f242b7"
	instance_type   = "t2.micro"
}
