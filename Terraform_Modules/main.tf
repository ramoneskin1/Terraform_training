module "ec2_cluster" {
  source       = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
  name         = "my-cluster"
  ami          = "ami-05cf1e9f73fbad2e2"
 instance_type = "t3.micro"
 subnet_id     = "subnet-c92f9cc8 " 

tags = {
Terraform   = "true"
Environment = "dev"
 }
}
