terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "proyecto" {
  ami           = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"

  tags = {
    Name = "proyecto01"
  }
}
