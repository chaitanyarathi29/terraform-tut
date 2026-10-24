provider "aws" {
  region = "us-east-1" # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami                    = "ami-0b6d9d3d33ba97d99" # Specify an appropriate AMI ID
  instance_type          = "t3.micro"
  key_name               = "jenkins-tut"
  region                 = "us-east-1"
  vpc_security_group_ids = [aws_security_group.inbound_traffic.id]
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "inbound_traffic" {
  name        = "inbound_config"
  description = "ssh allowing"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



