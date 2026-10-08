provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-0d27e0fb3bac4d724"  # Specify an appropriate AMI ID
    instance_type = "t3.micro"
    key_name      = "tut-aws"
    region        = "us-east-1"
}