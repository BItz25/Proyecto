terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 4.16"
    }
    
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "proyecto" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  key_names= "josue"
  security_groups= ["josue-proyecto","default"]

  tags = {
    Name = "proyecto01"
  }
}





  
