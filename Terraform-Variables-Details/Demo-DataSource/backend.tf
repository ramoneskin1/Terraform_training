terraform {
  backend "s3-bucket" {
    bucket = "tf-state-88fy"
    key    = "development/terraform_state"
    region = "us-east-1"
    }
  }
  
