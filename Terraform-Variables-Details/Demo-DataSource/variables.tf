variable "AWS_ACCESS_KEY" {
  type = string
  default = "AKIAUT2C35BWJVFCOXH5"
}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-2"
}

variable "Security_Group" {
  type = list
  default = ["sg-24076", "sg-90890", "sg-456789"]
}

  variable "AMIS" {
    typer = map
    default = {
      us-west-2 = "ami-0688ba7eeeeefe3cd"
      us-west-1 = "ami-0454207e5367abf01"
    }
  }
