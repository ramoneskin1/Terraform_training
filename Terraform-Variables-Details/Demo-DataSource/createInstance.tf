
data "aws_availability_zones" "available" {}

data "aws_ami" "latest-ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "MyInstance" {
  ami           = data.aws_ami.latest-ubuntu.id
  instance_type = t3.micro
  availability_zone = data.aws_availability_zones.available.names [1]

  provisioner "local-exec" {
    command = "echo aws_instance.MyInstance.private_ip >> my_private_ips.txt"
}

  tags = {
    Name = "custom_instance"
  }

  output "public_ip" {
    value = aws_instance.MyInstance.public_ip
  }

}


 
